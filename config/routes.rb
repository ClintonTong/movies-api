Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'movies', to: 'movies#index'
      post 'movies/create'
      post 'movies/update'
      post 'movies/update_rating'
      delete 'movies/:id', to: 'movies#destroy'
    end
  end

end
