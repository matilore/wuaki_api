Rails.application.routes.draw do
 
	constraints subdomain: 'api' do
		namespace :v1, defaults: {format: :json} do

			devise_for :users

			resources :users, :only => [:show]			
			resources :movies

			resources :series do
				resources :seasons do
					resources :episodes
				end
			end
			resources :all_medias, :only => [:index]
			resources :purchases, :only => [:index, :create]
			resources :two_days, :only => [:index, :create], controller: :purchases, type: :two_days
			resources :one_week, :only => [:index, :create], controller: :purchases, type: :one_week
			resources :registrations, :only =>[:create]
			resources :sessions, :only => [:create, :destroy]

  		end
	end
end