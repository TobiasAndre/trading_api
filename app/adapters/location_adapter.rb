# frozen_string_literal: true

class LocationAdapter
  API_URL = Rails.application.credentials[:location_api_url]
  API_KEY = Rails.application.credentials[:location_api_key]

  LocationUnavailable = Class.new(StandardError)

  class << self
    def call(string_location:)
      raw_response = RestClient.get(service_url(string_location))
      json_response = JSON.parse(raw_response.body)
      location_coordinates = { "lat": json_response[0]["lat"], "lon": json_response[0]["lon"] }

      location_coordinates
    rescue RestClient::ExceptionWithResponse
      raise LocationUnavailable
    end

    private

    def service_url(string_location)
      "#{API_URL}?key=#{API_KEY}&q=#{string_location}&format=json"
    end
  end
end
