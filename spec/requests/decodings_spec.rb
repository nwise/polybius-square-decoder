require 'rails_helper'

RSpec.describe "Decodings", type: :request do
  describe "GET /decodings" do
    it "works! (now write some real specs)" do
      get decodings_path
      expect(response).to have_http_status(200)
    end
  end
end
