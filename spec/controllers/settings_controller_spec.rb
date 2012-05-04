require 'spec_helper'

describe SettingsController do

  describe "GET 'overview'" do
    it "returns http success" do
      get 'overview'
      response.should be_success
    end
  end

  describe "GET 'members'" do
    it "returns http success" do
      get 'members'
      response.should be_success
    end
  end

end
