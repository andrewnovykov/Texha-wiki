Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :article_items
  root 'articles#index'
end
