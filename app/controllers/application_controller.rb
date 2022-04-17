class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def not_found
        render file: "#{Rails.root}/public/404.html",status: 404,layout: false
      end
      
      def authenticate_user
        if not user_signed_in?
          redirect_to sign_in_users_path
        end 
      end
end
