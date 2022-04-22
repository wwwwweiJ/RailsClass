class ApplicationController < ActionController::Base
# rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from Pundit::NotAuthorizedError, with: :not_found

include Pundit::Authorization
helper_method :user_signed_in? , :current_user 

  private

  def user_signed_in?
    session[:thankyou9527].present?
  end
  def current_user 
    User.find_by(id: session[:thankyou9527])
  end
  def not_found
    render file: "#{Rails.root}/public/404.html",status: 404,layout: false
  end
  def authenticate_user
          redirect_to sign_in_users_path unless user_signed_in?
  end
end
