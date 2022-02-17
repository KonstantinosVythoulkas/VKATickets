class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy email_update update_mobile]
  include UsersHelper
  # GET /users or /users.json
  def index
    @users = User.all
  end

  def two_factor_switch
   if  Settings.two_factor_status_switch(User.find_by_id(session[:user_id]),params[:commit]) == true
    redirect_back(fallback_location: users_path)
   else
    redirect_back(fallback_location: users_path, :notice => "")
   end
  end

  def email_update
    
  end

  def mark_as_read
    @notification = Notification.where(user_id: session[:user_id]).unread
    @notification.update_all(status: true) if !@notification.empty?
    respond_to do |format|
        format.js
    end
end

def password_reset
  user = User.reset_forgoten_password(User.find_by_email(user_params[:email]))
  if user 
    flash[:success] = "A recovery email have been send!"
    redirect_to users_login_path
  else
    flash[:error] = "Something went wrong, please try again!"
    redirect_to users_login_path
  end
end

def  resend_eimail_confirmation
  User.resend_email_activation_link(session[:user_id])
  redirect_back(fallback_location: users_path)
end

  def email_change
   status_code =  User.change_email(User.find_by_id(session[:user_id]),user_params[:old_email],user_params[:new_email],user_params[:email_confirmation])
    if status_code == 001
      redirect_back(fallback_location: users_path, :notice => "Old Email doesn't match with the user current Email")
    elsif status_code == 002
      redirect_back(fallback_location: users_path, :notice => "New Email is the same with the user current Email")
    elsif status_code == 004
      redirect_back(fallback_location: users_path, :notice => "Email isn't valid")
    elsif status_code == 005
      redirect_back(fallback_location: users_path, :notice => "This email is already used")
    else
      redirect_back(fallback_location: users_path, :notice => "Updated!")
    end
  end


  def update_mobile

  end

  def save_mobile_update
   if  User.save_mobile_details(User.find_by_id(session[:user_id]),params[:countryCode],user_params[:mobile])
    redirect_back(fallback_location: users_path, :notice => "Mobile number updated!")
   else
    redirect_back(fallback_location: users_path, :notice => "Something went wrong!")
   end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  def admin_filter
    if request.referrer.match(/([^\/]+$)/).to_s =~ /tickets.*\b/
      redirect_to tickets_path(department: user_params[:admin_filter])
    else
      redirect_to users_homepage_path(department: user_params[:admin_filter])
    end
  end

  def homepage
    @department = helpers.setUpCookie(params[:department])
    @user = User.find_by_id(session[:user_id])
    @tickets = helpers.dynamic_index(@user, nil, nil,  @department)
  end

  def settings
    @user = User.find_by_id(session[:user_id])
  end

  def login

  end

  def login_shield

  end

  def tryagain
    user =  helpers.resend(User.find_by_email(session[:user_email]))
    if !user
      flash[:error] = "You Session has expired!"
      session[:user_email] = nil
      redirect_to users_login_url
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def logout
    session[:user_id] = nil
    redirect_to users_login_path , :notice => "Logged out!"
  end


  def confirm_email
    
    user = User.find_by_id(Token.find_by_email_token(params[:id]).user_id) if Token.find_by_email_token(params[:id]) != nil
    if user
      user.email_activate
      flash[:success] = "Your email has been confirmed.
      Please sign in to continue."
      redirect_to users_login_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to users_login_path
    end
end


def change_forgoten_password
  user = User.find_by_id(Token.find_by_password_token(params[:id]).user_id) if Token.find_by_password_token(params[:id]) != nil
  if user
    helpers.setUpPasswordResetCookie(params[:id])
    redirect_to users_password_recovery_path
  else
    redirect_to users_login_path
  end
end

def password_recovery
 # user = User.find_by_id(Token.find_by_password_token(cookies[:token]).user_id)
  if cookies[:token] == nil
    redirect_to users_login_path
  end
end

def set_new_password
  if cookies[:token] == nil
    redirect_to users_login_path
  else
    user = User.update_password(User.find_by_id(Token.find_by_password_token( Base64.decode64(cookies[:token])).user_id), user_params[:password], user_params[:password_confirmation])
    if user 
      flash[:success] = "Password Updated"
      redirect_to users_login_path
    else
      redirect_to users_password_recovery_path
    end
  end
end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.settings.destroy
    @user.token.destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :encrypted_password, :password, :password_confirmation, :admin_filter, :email, :mobile, :salt, :group, :email_comfirmed, :two_factor, :loginpass, :old_password, :old_email, :new_email, :email_confirmation, :countryCode)
    end
end
