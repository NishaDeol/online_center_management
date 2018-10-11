Rails.application.routes.draw do

   
  devise_for :users
  get "/about_us", to: "home#about_us", as: "about_us"
  get "/contact_us", to: "home#contact_us", as: "contact_us"
  get "/student", to: "home#student", as: "student"
  get "/teacher", to: "home#teacher", as: "teacher"

  resources :books 
  resources :posts
  resources :products

  root to: "home#index"
end
