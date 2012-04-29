require 'spec_helper'
require 'cancan/matchers'

describe User do
  describe "user create" do
    it "should not save invalid user" do
      user = User.create
      assert user.new_record?.should be_true
    end
  end
  describe "abilities" do
    subject { ability }
    let(:ability) { Ability.new(user) }

    context "when is an normal user" do
      let(:user) { FactoryGirl.create(:user_with_profile) }

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

