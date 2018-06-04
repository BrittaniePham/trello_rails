Rails.application.routes.draw do

  resources :boards do
    resources :lists
  end
end
