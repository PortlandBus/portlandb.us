require "rails_helper"

RSpec.describe WriteupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/writeups").to route_to("writeups#index")
    end

    it "routes to #new" do
      expect(:get => "/writeups/new").to route_to("writeups#new")
    end

    it "routes to #show" do
      expect(:get => "/writeups/1").to route_to("writeups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/writeups/1/edit").to route_to("writeups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/writeups").to route_to("writeups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/writeups/1").to route_to("writeups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/writeups/1").to route_to("writeups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/writeups/1").to route_to("writeups#destroy", :id => "1")
    end

  end
end
