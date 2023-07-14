# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :authorize_request, except: :create

  def new
   @user = User.new
  end
  
  def create
     @user = User.find_by(email: user_params[:email])
    
     if @user && @user.valid_password?(user_params[:password])
      sign_in(@user)
      token = JsonWebToken.encode(user_id: @user.id)
			time = Time.now + 24.hours.to_i
			render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
											email: @user.email }, status: :ok
     else
      render json: { message: 'Invalid email or password' }
     end
    end

  private
  
  def user_params
   params.require(:user).permit(:email,:password,:password_confirmation)
  end
end

