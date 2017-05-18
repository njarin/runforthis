require 'rails_helper'

RSpec.describe Resource, type: :model do
  let(:resource) { FactoryGirl.create(:resource) }

  describe 'instantiation' do
    it 'persists in database' do
      expect(resource.created_at).not_to be_nil
    end

    it 'saves name correctly' do
      expect(resource.name).to eq "Washington State Democratic Party"
    end
  end

  describe 'associations' do
    let(:state_district) { FactoryGirl.create(:state_district) }
    let(:state_district2) { FactoryGirl.create(:state_district2) }

    it 'has many state districts' do
      resource.state_districts << state_district
      resource.state_districts << state_district2
      expect(resource.state_districts).to eq [state_district, state_district2]
    end
  end
end
