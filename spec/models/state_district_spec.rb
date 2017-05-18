require 'rails_helper'

RSpec.describe StateDistrict, type: :model do
  let(:state_district) { FactoryGirl.create(:state_district) }

  describe 'instantiation' do
    it 'persists in database' do
      expect(state_district.created_at).not_to be_nil
    end

    it 'saves name correctly' do
      expect(state_district.name).to eq "Congressional District 7"
    end
  end

  describe 'associations' do
    let(:state_legislator) { FactoryGirl.build(:state_legislator) }
    let(:state_legislator2) { FactoryGirl.build(:state_legislator2) }
    let(:resource) { FactoryGirl.create(:resource) }
    let(:resource2) { FactoryGirl.create(:resource2) }

    it 'has many state legislators' do
      state_legislator.state_district = state_district
      state_legislator2.state_district = state_district
      state_legislator.save
      state_legislator2.save
      expect(state_district.state_legislators).to eq [state_legislator, state_legislator2]
    end

    it 'has many resources' do
      state_district.resources << resource
      state_district.resources << resource2
      expect(state_district.resources).to eq [resource, resource2]
    end
  end
end
