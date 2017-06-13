class ResultsController < ApplicationController
  def results
    geocodio = Geocodio::Client.new(ENV['GEOCODIO_API_KEY'])
    input_address = address_to_string(params[:address])
    results = geocodio.geocode([input_address], fields: %w[cd stateleg school timezone]).best
    house_district = StateDistrict.find_by(name: results.house_district.name, state: results.state)
    senate_district = StateDistrict.find_by(name: results.senate_district.name, state: results.state)
    @offices = {
                'rep1' => {
                            'legislator' => house_district.state_legislators[0],
                            'resources' => house_district.resources,
                            'district' => house_district
                          },
                'rep2' => {
                            'legislator' => house_district.state_legislators[1],
                            'resources' => house_district.resources,
                            'district' => house_district
                          },
                'sen' => {
                            'legislator' => senate_district.state_legislators[0],
                            'resources' => senate_district.resources,
                            'district' => senate_district
                          }
              }
    render 'results/results'
  end

  private
  def address_to_string(address)
    "#{address[:street]} #{address[:city]} #{address[:state]} #{address[:zipcode]}"
  end
end
