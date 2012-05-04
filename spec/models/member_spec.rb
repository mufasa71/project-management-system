require 'spec_helper'

describe Member do
  describe "member create" do
    it "should not save invalid member" do
      member = Member.new
      assert member.new_record?.should be_true
    end
  end
end
# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

