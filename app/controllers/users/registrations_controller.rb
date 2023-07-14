# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

   def new
    @user = User.new
   end
  
   def create
    @user = User.new(user_registration_params)
    if @user.save
     render json: { message: 'Signed in successfully' }
    else
     render json: { message: 'User not created' }
    end
   end
  
   private
  
   def user_registration_params
    params.require(:user).permit(:email, :password)
   end
end
