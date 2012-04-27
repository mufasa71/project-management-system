require 'spec_helper'

describe User do
  it "should not save invalid user" do
    user = User.create
    assert user.new_record?.should be_true
  end
end
