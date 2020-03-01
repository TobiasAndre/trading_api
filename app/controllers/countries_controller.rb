# frozen_string_literal: true

class CountriesController < ApplicationController
  def index
    @countries = Country.order(code: :asc)
    render json: @countries
  end
end
