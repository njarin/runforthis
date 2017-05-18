StateLegislator.destroy_all
StateDistrict.destroy_all
Resource.destroy_all

def create_state_legislators(wa_leg_noko, body)
  wa_leg_noko.css('.memberInformation').each do |member|
    state_legislator = StateLegislator.new
    member_name_raw_arr = member.at('.memberName').text.split(' ')
    state_legislator.full_name = member_name_raw_arr[1..-2].join(' ')
    state_legislator.title = member_name_raw_arr[0] == 'Representative' ? 'Rep.' : 'Sen.'
    state_legislator.party = member_name_raw_arr[-1].gsub(/[()]/, '')
    state_legislator.website = member.at_css('a:contains("Home Page")')["href"]
    # NEED TO FIX SENATOR TERMS!
    state_legislator.term_end = "November 2018"
    district_name_raw = member.at_css('a:contains("Legislative District")').text
    district_num = district_name_raw[/\d+/]
    district_name = "State #{body} District #{district_num}"
    state_legislator.state_district = StateDistrict.find_by(name: district_name)
    state_legislator.save
  end
end

dem_resource = Resource.create(name: "Washington State Democratic Party", link: "http://www.wa-democrats.org/")
rep_resource = Resource.create(name: "Washington State Republican Party", link: "https://wsrp.org/")

49.times do |i|
  state_house_district = StateDistrict.create(state: "WA", name: "State House District #{i + 1}")
  state_house_district.resources << dem_resource << rep_resource
  state_senate_district = StateDistrict.create(state: "WA", name: "State Senate District #{i + 1}")
  state_senate_district.resources << dem_resource << rep_resource
end

wa_state_reps_link = 'http://leg.wa.gov/house/representatives/pages/default.aspx'
wa_state_sens_link = 'http://leg.wa.gov/senate/senators/pages/default.aspx'

wa_state_reps_noko = Nokogiri::HTML(open(wa_state_reps_link))
wa_state_sens_noko = Nokogiri::HTML(open(wa_state_sens_link))

create_state_legislators(wa_state_reps_noko, "House")
create_state_legislators(wa_state_sens_noko, "Senate")
