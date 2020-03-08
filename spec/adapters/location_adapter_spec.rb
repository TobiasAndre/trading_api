# frozen_string_literal: true

require "rails_helper"

describe LocationAdapter do
  subject(:location_response) { described_class.call(params) }

  let(:params) { { string_location: location } }

  describe "#call" do
    context "when location is valid" do
      let(:location) { "checkpoint charlie" }
      let(:expected_response) { { "lat": "52.5075075", "lon": "13.3903737" } }

      it "returns the correct coordinates", :vcr do
        expect(location_response).to be_eql(expected_response)
      end
    end

    context "when location is invalid" do
      let(:location) { "." }
      let(:expected_response) { { error: "Location not found" } }

      it "raises LocationUnavailable", :vcr do
        expect { location_response }.to raise_error(LocationAdapter::LocationUnavailable)
      end
    end
  end
end