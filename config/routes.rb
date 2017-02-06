Rails.application.routes.draw do
  get 'dashboard/admin_home'

  get 'dashboard/teacher_home'

  get 'dashboard/student_home'

  resources :questions
  resources :learner_dimension_scales
  resources :learner_styles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'questions#index'
end
