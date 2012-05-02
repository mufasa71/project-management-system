require 'spec_helper'

describe RelationshipsController do

  # This should return the minimal set of attributes required to create a valid
  # Role. As you add validations to Role, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :follower_id => subject.current_user.id, :followed_id => @other_user.id }
  end
  
  login_user

  describe "POST create" do
    before { @other_user = FactoryGirl.create(:unique_user) }
    describe "with valid params" do
      it "creates a new Relationship" do
        expect {
          post :create, {:relationship => valid_attributes}
        }.to change(Relationship, :count).by(1)
      end

      it "redirects to the user" do
        post :create, {:relationship => valid_attributes}
        response.should redirect_to user_path(valid_attributes[:followed_id])
      end
    end

    describe "with invalid params" do
      it "redirect to the root path" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relationship.any_instance.stub(:create).and_return(false)
        post :create, {:relationship => {}}
        response.should redirect_to root_path
      end
    end
  end

  describe "DELETE destroy" do
    let(:other_user) { FactoryGirl.create(:unique_user) }
    before { @relationship = FactoryGirl.create(:relationship, :follower_id => subject.current_user.id, :followed_id => other_user) }
    it "destroys the requested relationship" do
      expect {
        delete :destroy, {:id => @relationship.to_param}
      }.to change(Relationship, :count).by(-1)
    end

    it "redirects to the user page" do
      delete :destroy, {:id => @relationship.to_param}
      response.should redirect_to(user_path(@relationship.follower_id))
    end

    it "redirects to the root path with invalid params" do
      delete :destroy, {:id => 0}
      response.should redirect_to(root_path)
    end
  end
end
