


StateLegislator.destroy_all
StateDistrict.destroy_all
Resource.destroy_all

def create_state_legislators(wa_leg_noko)
  wa_leg_noko.css('.memberInformation').each do |member|
    state_legislator = StateLegislator.new
    member_name_raw_arr = member.at('.memberName').text.split(' ')
    state_legislator.full_name = member_name_raw_arr[1..-2].join(' ')
    state_legislator.party = member_name_raw_arr[-1].gsub(/[()]/, '')
    state_legislator.website = member.at_css('a:contains("Home Page")')["href"]
    # NEED TO FIX SENATOR TERMS!
    district_name_raw = member.at_css('a:contains("Legislative District")').text
    district_num = district_name_raw[/\d+/]
    if member_name_raw_arr[0] == 'Representative'
      state_legislator.title =  'Rep.'
      state_legislator.term_end = "November 2018"
      district_name = "State House District #{district_num}"
    else
      state_legislator.title =  'Sen.'
      state_legislator.term_end = "November 2018" #FIX THIS!!!
      district_name = "State Senate District #{district_num}"
    end
    state_legislator.state_district = StateDistrict.find_by(name: district_name)
    state_legislator.save
  end
end

def find_senate_terms
  wa_wiki_noko = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/Washington_State_Senate'))
  wa_senate_table_noko = wa_wiki_noko.at_css('table:contains("Counties Represented")')

  wa_senate_term_ends = {}

  wa_senate_table_noko.css('tr').each do |member|
    district = member.css('td').first.text if member.css('td').first
    term_end_year = member.css('td').last.text if member.css('td').last
    case term_end_year
    when "2017"
      term_end_date = "November 2017"
    when "2018"
      term_end_date = "November 2018"
    when "2020"
      term_end_date = "November 2020"
    end
    wa_senate_term_ends[district] = term_end_date
  end

  wa_senate_term_ends
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

create_state_legislators(wa_state_reps_noko)
create_state_legislators(wa_state_sens_noko)
