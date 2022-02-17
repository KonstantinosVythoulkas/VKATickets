Rails.application.routes.draw do
  get 'users/homepage'
  post 'users/homepage' => "users#homepage"

  get 'users/settings'
  post 'users/settings' => 'users#settings'

  get 'users/login_shield'
  post 'users/login_shield' => "users#login_shield"

  get '/', to: redirect('users/login')

  get 'users/login'
  post 'users/login' => 'users#login'
  
  get 'users/email_update'
  post 'users/email_update' => 'users#email_update'

  get 'tickets/tickets_tasks'
  post 'tickets/tickets_tasks' => 'tickets#tickets_tasks'

  get 'users/update_mobile'
  post 'users/update_mobile' => 'users/update_mobile'

  get 'users/password_recovery'
  post 'users/password_recovery' => 'users/password_recovery'

  resources :users do
    post :verify, on: :collection, as: :verify
    post :login_verify, on: :collection, as: :login_verify
    post :tryagain, on: :collection, as: :tryagain
    post :two_factor_switch, on: :collection, as: :two_factor_switch
    post :email_change, on: :collection, as: :email_change
    post :save_mobile_update, on: :collection, as: :save_mobile_update
    post :admin_filter, on: :collection, as: :admin_filter
    post :password_reset, on: :collection, as: :password_reset
    post :set_new_password, on: :collection, as: :set_new_password
    member do
      put "mark_as_read" => "users#mark_as_read"
      get :confirm_email
      get :change_forgoten_password
    end
  end

  resources :tickets do 
    post :watch, on: :collection, as: :watch
    post :unwatch, on: :collection, as: :unwatch
    post :imWorkingOnIt, on: :collection, as: :imWorkingOnIt
    post :solved, on: :collection, as: :solved
  end

  resources :progresss do
    post :add_subtasks, on: :collection, as: :add_subtasks
    post :assing_task, on: :collection, as: :assing_task
  end
  
  resources :comments do
      post :reply, on: :collection, as: :reply
      post :employee_reply, on: :collection, as: :employee_reply
  end

  get "/resend_eimail_confirmation" => "users#resend_eimail_confirmation", :as => "resend_eimail_confirmation"
  get "/log_out" => "users#logout", :as => "log_out"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
