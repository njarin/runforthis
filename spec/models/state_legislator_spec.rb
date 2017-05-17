require 'rails_helper'

RSpec.describe StateLegislator, type: :model do
  let(:state_legislator) { FactoryGirl.build(:state_legislator) }
  let(:state_district) { FactoryGirl.create(:state_district) }

  describe 'instantiation' do
    it 'persists in database' do
      state_legislator.state_district = state_district
      state_legislator.save
      expect(state_legislator.created_at).not_to be_nil
    end

    it 'saves name correctly' do
      state_legislator.state_district = state_district
      state_legislator.save
      expect(state_legislator.full_name).to eq "Dan McKeon"
    end
  end

  describe 'associations' do
    it 'belongs to a state district' do
      state_legislator.state_district = state_district
      state_legislator.save
      expect(state_legislator.state_district).to eq state_district
    end
  end
end
