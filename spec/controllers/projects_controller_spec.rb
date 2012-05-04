require 'spec_helper'

describe ProjectsController do

  def valid_attributes
    { :name => "My Project", :identifier => "my_project", :homepage => "homepage" }
  end
  
  login_user

  before(:each) { @project = FactoryGirl.create(:project) }

  describe "GET index" do
    it "assigns all projects as @projects" do
      get :index, {}
      assigns(:projects).should eq([@project])
    end
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      get :show, {:id => @project.to_param}
      assigns(:project).should eq(@project)
    end
  end

  describe "GET new" do
    it "assigns a new project as @project" do
      get :new, {}
      assigns(:project).should be_a_new(Project)
    end
  end

  describe "GET edit" do
    it "assigns the requested project as @project" do
      get :edit, {:id => @project.to_param}
      assigns(:project).should eq(@project)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, {:project => valid_attributes}
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => valid_attributes}
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the created project" do
        post :create, {:project => valid_attributes}
        response.should redirect_to(Project.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => {}}
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project" do
        # Assuming there are no other projects in the database, this
        # specifies that the Project created on the before line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Project.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @project.to_param, :project => {'these' => 'params'}}
      end

      it "assigns the requested project as @project" do
        put :update, {:id => @project.to_param, :project => valid_attributes}
        assigns(:project).should eq(@project)
      end

      it "redirects to the project" do
        put :update, {:id => @project.to_param, :project => valid_attributes}
        response.should redirect_to(@project)
      end
    end

    describe "with invalid params" do
      it "assigns the project as @project" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => @project.to_param, :project => {}}
        assigns(:project).should eq(@project)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => @project.to_param, :project => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested project" do
      expect {
        delete :destroy, {:id => @project.to_param}
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      delete :destroy, {:id => @project.to_param}
      response.should redirect_to(projects_url)
    end
  end
end
