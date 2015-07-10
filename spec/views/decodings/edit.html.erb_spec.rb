require 'rails_helper'

RSpec.describe "decodings/edit", type: :view do
  before(:each) do
    @decoding = assign(:decoding, Decoding.create!(
      :plain => "MyText",
      :encrypted => "MyText"
    ))
  end

  it "renders the edit decoding form" do
    render

    assert_select "form[action=?][method=?]", decoding_path(@decoding), "post" do

      assert_select "textarea#decoding_plain[name=?]", "decoding[plain]"

      assert_select "textarea#decoding_encrypted[name=?]", "decoding[encrypted]"
    end
  end
end
