# frozen_string_literal: true

class LocodesController < ApplicationController
  has_scope :filter_by_local

  def index
    @locodes = Locode.includes(:country).limit(100)
    render json: @locodes
  end
end
