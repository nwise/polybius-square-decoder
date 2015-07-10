require 'rails_helper'

RSpec.describe "decodings/index", type: :view do
  before(:each) do
    assign(:decodings, [
      Decoding.create!(
        :plain => "MyText",
        :encrypted => "MyText"
      ),
      Decoding.create!(
        :plain => "MyText",
        :encrypted => "MyText"
      )
    ])
  end

  it "renders a list of decodings" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
