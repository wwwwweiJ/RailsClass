class ResumesController < ApplicationController

before_action :resume_find , only: [:show]
before_action :find_my_resume , only: [ :destroy , :edit , :update]
before_action :authenticate_user , except: [:index , :show]

  include UsersHelper

  def index
    @resumes = Resume.published
  end

  def my
    @resumes = current_user.resumes
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = current_user.resumes.new(params_resume)
    
    if @resume.save
      redirect_to root_path , notice: "新增成功"
    else
      render :new
    end
  end

  def show

  end

  def destroy 
    @resume.destroy if @resume
    redirect_to "/" , alert: "刪除成功"
  end

  def edit

  end

  def update
    @resume.update(params_resume)
    if @resume.save
      redirect_to"/" , notice: "更新成功"
    else
      render :edit
    end
  end


private

  def params_resume
    params.require(:resume).permit(:title , :content , :status)
  end

  def resume_find
    @resume = Resume.find(params[:id])
      if user_signed_in?
        find_my_resume
      else
        @resume = Resume.published.find(params[:id])
      end
  end

  def find_my_resume
    # @resume = Resume.find_by!(id: params[id] , user_id: current_user.id)
    @resume = current_user.resumes.find(params[:id])
  end
end
