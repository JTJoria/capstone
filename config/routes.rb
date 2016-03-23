Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get '/persons' => 'persons#index'
      post '/persons' => 'persons#create'
    end
  end


  namespace :api do
    namespace :v1 do
      get '/clothing_selections' => 'clothing_selections#index'
      post '/clothing_selections' => 'clothing_selections#create'
    end
  end

root 'creators#index'

  devise_for :creators, controllers: { registrations: "registrations" }

  get '/creators/:id/edit' => 'creators#edit'
  patch '/creators/:id' => 'creators#update'


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

  get '/trips/:trip_id/persons' => 'persons#index'
  get '/trips/:trip_id/persons/new' => 'persons#new'
  post '/trips/:trip_id/persons' => 'persons#create'
  get '/trips/:trip_id/persons' => 'persons#show'
  get '/trips/:trip_id/persons/:id/edit' => 'persons#edit'
  patch '/trips/:trip_id/persons/:id' => 'persons#update'
  get '/trips/:trip_id/persons/:id' => 'persons#show'


  get '/trips/:trip_id/situations' => 'situations#index'
  get '/trips/:trip_id/situations/new' => 'situations#new'
  post '/trips/:trip_id/situations' => 'situations#create'
  get '/trips/:trip_id/situations' => 'situations#show'

  post '/trips/:trip_id/situations/addsituation' => 'situations#add_situation'
  delete '/trips/:trip_id/situations/removesituation' => 'situations#remove_situation'

  get '/trips/:trip_id/clothing_selections' => 'clothing_selections#index'

end
