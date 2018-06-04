Rails.application.routes.draw do
  
  resources :boards do
    resources :lists
  end

  scope 'lists/:list_id', as: 'list' do
    resources :tasks
  end
end
