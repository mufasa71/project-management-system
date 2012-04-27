require 'spec_helper'

describe Role do
  it "should now save invalid role" do
    r = Role.create
    assert r.new_record?.should be_true
  end
end
