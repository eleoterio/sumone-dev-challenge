Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api'  do
    resources :drinks_recommend, only: [:index]
    resources :drinks_name, only: [:index]
	end
  root to: 'drinks#index'

  resources :home, only: %i[index]
end
