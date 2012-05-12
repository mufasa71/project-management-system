require "spec_helper"

describe IssueCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/issue_categories").should route_to("issue_categories#index")
    end

    it "routes to #new" do
      get("/issue_categories/new").should route_to("issue_categories#new")
    end

    it "routes to #show" do
      get("/issue_categories/1").should route_to("issue_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/issue_categories/1/edit").should route_to("issue_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/issue_categories").should route_to("issue_categories#create")
    end

    it "routes to #update" do
      put("/issue_categories/1").should route_to("issue_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/issue_categories/1").should route_to("issue_categories#destroy", :id => "1")
    end

  end
end
