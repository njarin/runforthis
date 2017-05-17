require 'rails_helper'

RSpec.describe StateLegislator, type: :model do
  let(:state_legislator) { FactoryGirl.create(:state_legislator) }
  it 'test to ensure rspec is correctly configured' do
    expect(state_legislator.full_name).to eq "Dan McKeon"
  end
end
