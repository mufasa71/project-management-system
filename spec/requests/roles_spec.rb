require 'spec_helper'

describe "Roles" do
  describe "GET admin/roles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_roles_path
      response.status.should be(302)
    end
  end
end
