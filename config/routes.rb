Rails.application.routes.draw do
  resources :file_uploads
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "file_uploads#index"
end
