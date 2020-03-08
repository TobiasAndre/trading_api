# frozen_string_literal: true

class LocationService
  def initialize(string_location:)
    @string_location = string_location
  end

  def perform
    LocationAdapter.call(
      string_location: string_location
    )
  end

  private

  attr_reader :string_location
end
