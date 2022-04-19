module UsersHelper
    def user_signed_in?
        session[:thankyou9527].present?
    end
    def current_user 
        User.find_by(id: session[:thankyou9527])
    end
    def markdown(content)
        tag.article data: {controller: "markdown-viewer"} do 
            content
        end
    end
end
