

wa_state_reps_page = 'http://leg.wa.gov/house/representatives/pages/default.aspx'

wa_state_reps_noko = Nokogiri::HTML(open(wa_state_reps_page))

wa_state_reps_noko.css('.memberInformation').each do |member|
  state_legislator = StateLegislator.new
  member_name_raw_arr = member.at('.memberName').text.split(' ')
  state_legislator.full_name = member_name_raw_arr[1..-2].join(' ')
  state_legislator.title = member_name_raw_arr[0] == 'Representative' ? 'Rep.' : 'Sen.'
  state_legislator.party = member_name_raw_arr[-1].gsub(/[()]/, '')
  state_legislator.website = member.at_css('a:contains("Home Page")')["href"]
  state_legislator.term_end = "November 2018"
  district_name_raw = member.at_css('a:contains("Legislative District")').text
  district_num = district_name_raw[/\d+/]
  district_name = "State House District #{district_num}"
  state_legislator.state_district = StateDistrict.find_by(name: district_name)
  state_legislator.save
end
