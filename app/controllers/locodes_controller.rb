# frozen_string_literal: true

class LocodesController < ApplicationController
  def index
    @locodes = Locode.includes(:country).paginate(page: params[:page], per_page: 30)
    render json: @locodes
  end

  def find_by_place
    return params_missing? if empty_place_params?

    @locodes = Locode.includes(:country).filter_by_place(params[:place])
                     .paginate(page: params[:page], per_page: 30)
    render json: @locodes
  end

  def find_by_address
    return params_missing? if empty_address_params?

    coordinates = address_coordinates

    @locodes = Locode.includes(:country).filter_by_address(coordinates)
                     .paginate(page: params[:page], per_page: 30)
    render json: @locodes
  end

  private

  def address_coordinates
    Rails.cache.fetch(cache_key, expires_in: 30.days) do
      LocationService.new(location_params).perform
    end
  end

  def empty_address_params?
    params[:address].blank?
  end

  def empty_place_params?
    params[:place].blank?
  end

  def params_missing?
    render json: { "message": "all parameters are required" }, status: :unprocessable_entity
  end

  def location_params
    {
      string_location: params.dig(:address)
    }
  end

  def cache_key
    params.dig(:address).to_s
  end
end
