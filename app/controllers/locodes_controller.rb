# frozen_string_literal: true

class LocodesController < ApplicationController
  def index
    @locodes = Locode.includes(:country).paginate(page: params[:page], per_page: 30)
    render json: @locodes
  end

  def find_by_place
    if params[:place].present?
      @locodes = Locode.includes(:country).filter_by_place(params[:place]).paginate(page: params[:page], per_page: 30)
      render json: @locodes
    else
      render json: { error: "place parameter is required" }, status: :unprocessable_entity
    end
  end

  def find_by_address
    if params[:address].present?
      @locodes = Locode.includes(:country).filter_by_address(params[:address]).paginate(page: params[:page], per_page: 30)
      render json: @locodes
    else
      render json: { error: "address parameter is required" }, status: :unprocessable_entity
    end
  end
end
