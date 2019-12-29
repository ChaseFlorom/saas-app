
Rails.application.routes.draw do
    resources :projects
    devise_for :users
    get 'home/index'
    root 'home#index'
end

