# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'when creating a new country' do
    it 'is valid with description' do
      country = create(:country)
      expect(country).to be_valid
    end
  end
end