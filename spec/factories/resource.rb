FactoryGirl.define do
  factory :resource do
    name "Washington State Democratic Party"
    link "http://www.wa-democrats.org/"
  end

  factory :resource2, class: Resource do
    name "Washington State Republican Party"
    link "https://wsrp.org/"
  end
end
