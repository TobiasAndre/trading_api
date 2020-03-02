require 'swagger_helper'

describe "Trading API" do
  path "/locodes/find_by_place" do
    parameter in: :query, name: :place, schema: { type: :string }, description: "The city name or country name/initials", required: true
    get "Search locodes by place name" do
      tags "Locode information"
      produces 'application/json'

      let(:place) { 'US' }

      response "200", "locode found" do  
        run_test!
      end
    end
  end

  path "/locodes/find_by_address" do
    parameter in: :query, name: :address, schema: { type: :string }, description: "The locode address", required: true
    get "Search locodes by place address" do
      tags "Locode information"
      produces 'application/json'

      let(:address) { 'Perry' }
      response "200", "locode found" do
        run_test!
      end
    end
  end
end