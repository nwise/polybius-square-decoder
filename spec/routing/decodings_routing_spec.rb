require "rails_helper"

RSpec.describe DecodingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/decodings").to route_to("decodings#index")
    end

    it "routes to #new" do
      expect(:get => "/decodings/new").to route_to("decodings#new")
    end

    it "routes to #show" do
      expect(:get => "/decodings/1").to route_to("decodings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/decodings/1/edit").to route_to("decodings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/decodings").to route_to("decodings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/decodings/1").to route_to("decodings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/decodings/1").to route_to("decodings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/decodings/1").to route_to("decodings#destroy", :id => "1")
    end

  end
end
