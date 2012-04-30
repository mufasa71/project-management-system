require 'spec_helper'
require 'cancan/matchers'

describe User do
  let(:user) { FactoryGirl.create(:user_with_profile) }
  
  subject { user }

  describe "user create" do
    it "should not save invalid user" do
      user = User.create
      assert user.new_record?.should be_true
    end
  end
  
  describe "relationships" do
    it { should respond_to(:relationships) }
    it { should respond_to(:followed_users) }
    it { should respond_to(:follow!) }
    it { should respond_to(:following?) }
  end

  describe "following" do
    let(:other_user) { FactoryGirl.create(:unique_user) }
    before do
      user.follow!(other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }
    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(user) }
    end
    describe "unfollowing" do
      before { user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end

  describe "abilities" do
    subject { ability }
    let(:ability) { Ability.new(user) }

    context "when is an normal user" do

      it {should be_able_to(:show, User.new) }
      it {should be_able_to(:update, user.profile) }
      it {should be_able_to(:edit, user.profile) }
      it {should be_able_to(:show, Profile.new) }
      it {should be_able_to(:new, Profile.new) }
      it {should_not be_able_to(:update, User.new) }
      it {should_not be_able_to(:edit, User.new) }
    end
  end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  getting_started        :boolean         default(TRUE)
#  admin                  :boolean         default(FALSE)
#

