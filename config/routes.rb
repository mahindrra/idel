Rails.application.routes.draw do
  
  resources :objectives do
    resources :lessons
  end  
  resources :courses
  get 'instructor/learners'
  get 'instructor/dashboard'

  get 'instructor/create_course'

  get 'instructor/new_course'
  get 'instructor/guide'

  get 'instructor/list_course'

  get 'instructor/update_course'

  get 'admin/users'

  get 'admin/courses'

  get 'dashboard/admin_home'

  get 'dashboard/teacher_home'

  get 'dashboard/student_home'
  get 'dashboard/edit_profile'
  post 'dashboard/save_profile'
  post 'dashboard/test'
  get 'dashboard/index'

  resources :questions
  resources :learner_dimension_scales
  resources :learner_styles
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
