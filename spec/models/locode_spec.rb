# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Locode, type: :model do
  context 'when creating a new locode' do
    let(:locode) { create(:locode) }
    it 'and the record is valid' do
      expect(locode).to be_valid
    end
  end

  context 'scopes' do
    let(:locode) { create(:locode) }
    it "applies find_by_place scope" do
      expect(Locode.filter_by_place(locode.full_name)).to include(locode)
    end

    it "applies find_by_place scope" do
      expect(Locode.filter_by_address(locode.full_name)).to include(locode)
    end
  end
end
