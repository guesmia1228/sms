Rails.application.routes.draw do
  root 'home#index'
  resources :students
  resources :courses
end
