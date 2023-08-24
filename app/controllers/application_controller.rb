class ApplicationController < ActionController::API
  attr_reader :current_user

  before_action :authenticate_token!

  private

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload['sub'])
  rescue JWT::ExpiredSignature
    render json: { error: 'your authentication token is expired' }
  rescue JWT::DecodeError
    render json: { error: 'Incorrect authentication token' }
  end

  def auth_token
    @auth_token ||= request.headers.fetch('Authorization', '').split(' ').last
  end
end
