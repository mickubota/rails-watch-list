Rails.application.routes.draw do
  resources :lists, only: [:index, :new, :show, :create, :edit, :update] do
    resources :bookmarks, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
