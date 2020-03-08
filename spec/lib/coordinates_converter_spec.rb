# frozen_string_literal: true

require "rails_helper"

describe CoordinatesConverter do
  subject(:coordinates_response) { described_class.dms_to_decimal(value, orientation) }
  
  describe "#call" do
    context "when the coordinate is valid" do
      let(:value) { '4230' }
      let(:orientation) { 'N' }
      let(:expected_response) { 42.49999999999999 }

      it 'North coordinates' do
        expect(coordinates_response).to be_eql(expected_response)
      end
    end

    context "when the corrdinate is invalid" do
      let(:value) { 'dasddad' }
      let(:orientation) { 'X' }

      it "raises ConverterError" do
        expect { coordinates_response }.to raise_error(CoordinatesConverter::ConverterError)
      end
    end
  end
end