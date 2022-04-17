class SessionsController < ApplicationController

    def create
        user = User.login(params[:user])
        if user 
            session[:thankyou9527] = user.id
            redirect_to root_path , notice: "登入成功"
        else
            redirect_to sign_in_users_path , alert: "帳號密碼錯誤"
        end
    end

    def destroy
        session[:thankyou9527] = nil
        redirect_to root_path , notice: "登出成功"
    end

end