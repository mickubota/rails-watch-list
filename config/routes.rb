Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists, only: [:index, :new, :show, :create, :edit, :update] do
    resources :bookmarks, only: [:index, :create, :new]
  end

  resources :bookmarks, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
