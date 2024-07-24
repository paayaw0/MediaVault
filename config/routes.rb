Rails.application.routes.draw do
  get '/data_hubs/:data_hub_id/file_uploads/:id/rename', to: 'file_uploads#rename', as: :rename_file
  
  resources :data_hubs do
    resources :file_uploads
  end
  

  # Defines the root path route ("/")
  root "file_uploads#index"
end
