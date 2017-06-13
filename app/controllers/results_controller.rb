class ResultsController < ApplicationController
  def results
    geocodio = Geocodio::Client.new(ENV['GEOCODIO_API_KEY'])
    input_address = address_to_string(params[:address])
    results = geocodio.geocode([input_address], fields: %w[cd stateleg school timezone]).best
    house_district = StateDistrict.find_by(name: results.house_district.name, state: results.state)
    senate_district = StateDistrict.find_by(name: results.senate_district.name, state: results.state)
    p "=="*20
    p house_district.state_legislators
    p senate_district.state_legislators
    p "=="*20
    p house_district.resources
    # p results.senate_district.name
    # p results.state
    render 'results/results'
  end

  private
  def address_to_string(address)
    "#{address[:street]} #{address[:city]} #{address[:state]} #{address[:zipcode]}"
  end
end
