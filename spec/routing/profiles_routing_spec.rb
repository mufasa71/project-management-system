require "spec_helper"

describe ProfilesController do
  describe "routing" do

    it "routes to #new" do
      get("users/1/profiles/new").should route_to("profiles#new", :user_id => "1")
    end

    it "routes to #show" do
      get("users/1/profiles/1").should route_to("profiles#show", :id => "1", :user_id => "1")
    end

    it "routes to #edit" do
      get("users/1/profiles/1/edit").should route_to("profiles#edit", :id => "1", :user_id => "1")
    end

    it "routes to #update" do
      put("users/1/profiles/1").should route_to("profiles#update", :id => "1", :user_id => "1")
    end
  end
end
