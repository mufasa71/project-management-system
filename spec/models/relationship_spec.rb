require 'spec_helper'

describe Relationship do
  let(:follower) { FactoryGirl.create(:unique_user) }
  let(:followed) { FactoryGirl.create(:unique_user) }
  let(:relationship) do
    follower.relationships.build(followed_id: followed.id)
  end

  subject { relationship }

  describe "accessible attributes" do
    it "should not allow access to follower_id" do
      expect do
        Relationship.new(follower_id: follower.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "follower methods" do
    before { relationship.save }

    it { should respond_to (:follower) }
    it { should respond_to (:followed) }
    its(:follower) { should == follower }
    its(:followed) { should == followed }
  end

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end
end
        
