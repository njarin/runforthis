Rails.application.routes.draw do
  root 'search#search'
  get '/results', to: 'results#results'
  get '/about', to: 'search#about'
end
