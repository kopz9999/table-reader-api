Rails.application.routes.draw do
  resources :documents do
    get :download, on: :member
  end
end
