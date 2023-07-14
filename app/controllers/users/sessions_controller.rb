# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  def new
   @user = User::Session.new
  end
  
  def create
    debugger
    @user = User::Session.new(user_params)
    if @user.save
      render json: {message: 'User signed in'}
    else
      render json: {message: 'User not create'}
    end
  end

  private
  def user_params
   params.require(:user).permit(:email,:password,:password_confirmation)
  end

end
