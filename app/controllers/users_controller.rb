class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create 
        @user = User.new(params[:id])
        if @user.save
            redirect_to"/" , notice: "註冊成功"
        end
    end
end
