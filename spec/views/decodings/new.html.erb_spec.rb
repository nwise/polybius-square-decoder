require 'rails_helper'

RSpec.describe "decodings/new", type: :view do
  before(:each) do
    assign(:decoding, Decoding.new(
      :plain => "MyText",
      :encrypted => "MyText"
    ))
  end

  it "renders new decoding form" do
    render

    assert_select "form[action=?][method=?]", decodings_path, "post" do

      assert_select "textarea#decoding_plain[name=?]", "decoding[plain]"

      assert_select "textarea#decoding_encrypted[name=?]", "decoding[encrypted]"
    end
  end
end
