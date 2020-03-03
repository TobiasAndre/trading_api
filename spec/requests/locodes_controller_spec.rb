# frozen_string_literal: true

require "rails_helper"

describe LocodesController, type: :request do

  describe "GET #index" do
    let!(:locode) { create(:locode) }

    context "when index is requested" do
      it "return data", :vcr do
        get "/locodes", params: {}
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).count).to eq 1
      end
    end

    context "when find_by_place is requested" do
      it "return data if params are present", :vcr do
        get "/locodes/find_by_place", params: { place: locode.full_name }
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).count).to eq 1
      end

      it "return error if no params are present" do
        get "/locodes/find_by_place", params: { }
        expect(response).to have_http_status(422)
      end
    end

    context "when find_by_address is requested" do
      it "return data if params are present", :vcr do
        get "/locodes/find_by_address", params: { address: locode.full_name }
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).count).to eq 1
      end

      it "return error if no params are present" do
        get "/locodes/find_by_address", params: { }
        expect(response).to have_http_status(422)
      end
    end
  end
end
