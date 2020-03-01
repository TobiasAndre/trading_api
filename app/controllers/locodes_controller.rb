# frozen_string_literal: true

class LocodesController < ApplicationController
  def index
    @locodes = Locode.includes(:country).paginate(page: params[:page], per_page: 30)
    render json: @locodes
  end
end
