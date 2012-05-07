require 'spec_helper'

describe SettingsController do

  before(:each) { @project = FactoryGirl.create(:project) }
  describe "GET 'information'" do
    it "returns http success" do
      get 'information', {:id => @project.to_param}
      response.should be_success
    end
  end

  describe "GET 'members'" do
    it "returns http success" do
      get 'members', {:id => @project.to_param}
      response.should be_success
    end
  end

end
