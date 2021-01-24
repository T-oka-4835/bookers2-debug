Rails.application.routes.draw do
  get 'calenders/index'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :notifications, only: :index
  resources :calenders
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
end