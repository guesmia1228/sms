Rails.application.routes.draw do
  root 'home#index'
  resources :students
  resources :courses
  resources :departments
  resources :college_subjects
end
