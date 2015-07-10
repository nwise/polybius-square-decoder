require 'rails_helper'

RSpec.describe "decodings/show", type: :view do
  before(:each) do
    @decoding = assign(:decoding, Decoding.create!(
      :plain => "MyText",
      :encrypted => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
