Rails.application.routes.draw do
  root 'boards#index'
  put 'boards/:board_id/lists/:id/change_priority', to: 'lists#update_list_priority', as: 'update_list_priority'

  resources :boards do
    resources :lists
  end

  scope 'lists/:list_id', as: 'list' do
    resources :tasks
  end
end
