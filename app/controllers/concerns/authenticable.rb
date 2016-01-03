module Authenticable

  # Devise method -> current_user => overwritten -> current_user is retrieved from the token in http header
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers[:HTTP_AUTHORIZATION]) #OR ['Authorization']
  end


  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end
end