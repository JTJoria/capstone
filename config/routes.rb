Rails.application.routes.draw do

  devise_for :creators
root "packing#index"

  get '/packing' => 'packing#index' 
  get '/packing/new' => 'packing#new'
  post '/packing' => 'packing#create'
  get '/packing/:id' => 'packing#show'
  get '/packing/:id/edit' => 'packing#edit'
  patch '/packing/:id' => 'packing#update'
  delete '/packing/:id' => 'packing#destroy'

  post '/persons' => 'persons#create'
  get '/persons/:id' => 'persons#show'

  get '/locations' => 'locations#index'
  post '/locations' => 'locations#create'
  delete 'locations/:id' => 'locations#destroy'
  

  get '/trip_situations/new' => 'trip_situations#new'
  post '/trip_situations/:id' => 'trip_situations#create'
  get '/trip_situations/:id/edit' => 'trip_situations#edit'
  patch '/trip_situations/:id' => 'image#update'
  delete '/trip_situations/:id' => 'trip_situations#destroy'

end
