Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'notifications#new'
  post '/create', to: 'notifications#create', as: 'notify'
end
