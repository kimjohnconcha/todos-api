class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    
    if auth_token.present?
      user = JsonWebToken.decode(auth_token)
      @user = User.find(user[:user_id])
    end

    json_response(user: @user, auth_token: auth_token)
  end


  private
  

  def auth_params
    params.permit(:email, :password)
  end


end
