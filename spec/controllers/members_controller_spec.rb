require 'spec_helper'

describe MembersController do

  def valid_attributes
    { :user_id => 1, :project_id => @project }
  end
  

  before(:each) do
    @project = FactoryGirl.create(:project)
    @member = FactoryGirl.create(:member, :project_id => @project)
  end

  describe "GET index" do
    it "assigns all members as @members" do
      get :index, { :project_id => @project.to_param }
      assigns(:members).should_not eq([@member])
    end
  end

  describe "GET show" do
    it "assigns the requested member as @member" do
      get :show, {:id => @member.to_param}
      assigns(:member).should eq(@member)
    end
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      get :edit, {:id => @member.to_param}
      assigns(:member).should eq(@member)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested member" do
        # Assuming there are no other members in the database, this
        # specifies that the Member created on the previous before line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Member.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @member.to_param, :member => {'these' => 'params'}}
      end

      it "assigns the requested member as @member" do
        put :update, {:id => @member.to_param, :member => valid_attributes}
        assigns(:member).should eq(@member)
      end

      it "redirects to the project members" do
        put :update, {:id => @member.to_param, :member => valid_attributes}
        response.should redirect_to settings_members_project_path(@project)
      end
    end

    describe "with invalid params" do
      it "assigns the member as @member" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        put :update, {:id => @member.to_param, :member => {}}
        assigns(:member).should eq(@member)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        put :update, {:id => @member.to_param, :member => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested member" do
      expect {
        delete :destroy, {:id => @member.to_param, :project_id => @project.to_param}
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the project members list" do
      delete :destroy, {:id => @member.to_param, :project_id => @project.to_param}
      response.should redirect_to settings_members_project_path(@project)
    end
  end
end
