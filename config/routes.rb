Rails.application.routes.draw do

devise_for :creators

root 'packing#index'

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

  get '/trip_situations' => 'trip_situations#index' 
  get '/trip_situations/new' => 'trip_situations#new'
  post '/trip_situations' => 'trip_situations#create'
  get '/trip_situations/:id' => 'trip_situations#show'
  get '/trip_situations/:id/edit' => 'trip_situations#edit'
  patch '/trip_situations/:id' => 'trip_situations#update'
  delete '/trip_situations/:id' => 'trip_situations#destroy'

end
