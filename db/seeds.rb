wa_state_reps_page = 'http://leg.wa.gov/house/representatives/pages/default.aspx'

wa_state_reps_noko = Nokogiri::HTML(open(wa_state_reps_page))
