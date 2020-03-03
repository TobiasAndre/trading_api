# frozen_string_literal: true

class CountrySerializer < ActiveModel::Serializer
  has_many :locodes
  attributes :id, :code, :name
end
