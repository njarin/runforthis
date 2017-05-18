FactoryGirl.define do
  factory :state_district do
    state "WA"
    name "Congressional District 7"
  end

  factory :state_district2, class: StateDistrict do
    state "WA"
    name "Congressional District 3"
  end

end
