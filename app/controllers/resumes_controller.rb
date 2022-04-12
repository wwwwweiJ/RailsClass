class ResumesController < ApplicationController

before_action :resume_find , only: [:show , :destroy , :edit , :update]

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(params_resume)

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
  end
end
