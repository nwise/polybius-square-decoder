require 'rails_helper'

RSpec.describe Decoding, type: :model do

  context "Instance Methods" do

    subject{ Decoding.new }

    describe "Validations" do
      it { should validate_presence_of :encoded }
    end

    describe "Callbacks" do
      it "calls #decode before validation" do
        expect(subject).to receive(:decode)

        subject.valid?
      end
    end

    describe "#decode" do
      context "when decoding is successful" do

        it 'delegates to PolybiusSquare::PolybiusSquareProcessor' do
          subject.encoded = "some valid string"
          expect(PolybiusSquare::PolybiusSquareProcessor).to receive(:process).with(encoded_string: subject.encoded, dropped_char: 'j')

          subject.decode
        end
      end

      context "when decoding is unsuccessful" do
        it 'adds errors to #errors' do
          subject.encoded = "some invalid string"
          expect(PolybiusSquare::PolybiusSquareProcessor).to receive(:process).with(encoded_string: subject.encoded, dropped_char: 'j').and_raise(TypeError)

          expect(subject.decode).to have(1).error_on(:plain)
        end
      end

    end

    context "Class Methods" do
      subject{ Decoding }
    end

  end
end
