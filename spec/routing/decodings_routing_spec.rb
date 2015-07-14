require "rails_helper"

RSpec.describe DecodingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/decodings").to route_to("decodings#index")
    end

    it "routes to #create" do
      expect(:post => "/decodings").to route_to("decodings#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/decodings/1").to route_to("decodings#destroy", :id => "1")
    end

  end
end
