require 'rails_helper'

RSpec.describe StateLegislator, type: :model do
  it 'test to ensure rspec is correctly configured' do
    dan = StateLegislator.create(full_name: "Dan McKeon", title: "Representative", party: "D", website: "www.danmckeon.com", term_end: "2018")
    expect(dan.full_name).to eq "Dan McKeon"
  end
end
