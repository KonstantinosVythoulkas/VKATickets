class ApplicationController < ActionController::Base
    before_action  :login_required, except: [:login, :verify, :new, :create, :confirm_email, :password_reset, :change_forgoten_password, :password_recovery, :set_new_password]
    helper :all

  
    def verify
        user = User.authenticate(user_params[:username], user_params[:password])
       if  user && !helpers.two_factor_status(user)
        session[:user_id] = user.id
        redirect_to users_homepage_url
       elsif user && helpers.two_factor_status(user)
        redirect_to users_login_shield_url
       else
          flash[:error] = "User Doesn't exists"
          redirect_to users_login_url
          end
        end

          
        def login_verify
          user = helpers.auth_token_check(session[:user_email],user_params[:loginpass])
          if user == "expired"
            flash[:error] = "You Session has expired!"
            session[:user_email] = nil
            redirect_to users_login_url
          elsif !user
            flash[:error] = "Wrong Code!"
            redirect_to users_login_shield_url
          else
            session[:user_id] = user.id
            redirect_to users_homepage_url
          end
        end

        protected

        def login_required
          return true if session[:user_id] != nil
          access_denied
          return false
        end
  
        def access_denied
          redirect_to users_login_path
        end
  
end
