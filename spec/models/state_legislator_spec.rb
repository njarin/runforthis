require 'rails_helper'

RSpec.describe StateLegislator, type: :model do
  let(:state_legislator) { FactoryGirl.build(:state_legislator) }
  let(:state_district) { FactoryGirl.create(:state_district) }

  it 'persists in database' do
    state_legislator.state_district = state_district
    state_legislator.save
    expect(state_legislator.created_at).not_to be_nil
  end
end
