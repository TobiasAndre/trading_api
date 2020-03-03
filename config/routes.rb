# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :countries, :locodes, only: :index

  get "/locodes/find_by_place" => "locodes#find_by_place"
  get "/locodes/find_by_address" => "locodes#find_by_address"
end
