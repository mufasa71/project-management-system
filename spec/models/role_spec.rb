require 'spec_helper'

describe Role do
  it "should now save invalid role" do
    r = Role.create
    assert r.new_record?.should be_true
  end
end
# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  project_id :integer
#

