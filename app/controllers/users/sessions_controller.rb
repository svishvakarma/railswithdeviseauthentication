# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  def new
   @user = User.new
  end
  
  def create
     @user = User.find_by(email: user_params[:email])
    
     if @user && @user.valid_password?(user_params[:password])
      sign_in(@user)
      render json: { message: 'User signed in' }
     else
      render json: { message: 'Invalid email or password' }
     end
    end

  private
  
  def user_params
   params.require(:user).permit(:email,:password,:password_confirmation)
  end
end

