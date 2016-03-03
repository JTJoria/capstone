Rails.application.routes.draw do

  devise_for :creators

root 'creators#index'

  get '/persons' => 'persons#index' 
  get '/persons/new' => 'persons#new'
  post '/persons' => 'persons#create'
  get '/persons/:id' => 'persons#show'
  get '/persons/:id/edit' => 'persons#edit'
  patch '/persons/:id' => 'persons#update'
  delete '/persons/:id' => 'persons#destroy'

  get '/locations' => 'locations#index' 
  get '/locations/new' => 'locations#new'
  post '/locations' => 'locations#create'
  get '/locations/:id' => 'locations#show'
  get '/locations/:id/edit' => 'locations#edit'
  patch '/locations/:id' => 'locations#update'
  delete '/locations/:id' => 'locations#destroy'

  get '/situations' => 'situations#index' 
  get '/situations/new' => 'situations#new'
  post '/situations' => 'situations#create'
  get '/situations/:id' => 'situations#show'
  get '/situations/:id/edit' => 'situations#edit'
  patch '/situations/:id' => 'situations#update'
  delete '/situations/:id' => 'situations#destroy'

  get '/trips' => 'trips#index' 
  get '/trips/new' => 'trips#new'
  post '/trips' => 'trips#create'
  get '/trips/:id' => 'trips#show'
  get '/trips/:id/edit' => 'trips#edit'
  patch '/trips/:id' => 'trips#update'
  delete '/trips/:id' => 'trips#destroy'

  get '/clothing_selections' => 'clothing_selections#index'

  get '/weathers' => 'weathers#index'

end
