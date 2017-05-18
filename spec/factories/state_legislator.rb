FactoryGirl.define do
  factory :state_legislator do
    full_name "Dan McKeon"
    title "Representative"
    party "D"
    website "www.danmckeon.com"
    term_end "2018"
  end

  factory :state_legislator2, class: StateLegislator do
    full_name "Nick Jarin"
    title "Representative"
    party "D"
    website "www.nickjarin.com"
    term_end "2018"
  end
end
