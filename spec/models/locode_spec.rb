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
    let(:coordinates) {{:lat=>"40.7127281", :lon=>"-74.0060152"}}
    let(:locode) { create(:locode) }
    it "applies find_by_place scope" do
      expect(Locode.filter_by_place(locode.full_name)).to include(locode)
    end

    it "applies find_by_place scope" do
      expect(Locode.filter_by_address(coordinates)).to include(locode)
    end
  end
end
