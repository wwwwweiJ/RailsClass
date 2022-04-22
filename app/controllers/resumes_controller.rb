class ResumesController < BaseController 

before_action :resume_find , only: [:show ]
before_action :find_my_resume , only: [ :destroy , :edit , :update  , :pin]
before_action :authenticate_user , except: [:index , :show]


  def index
    # if user_signed_in?
    #   if current_user.role == "user" 
    #     @resumes = current_user.resumes.friendly.find_by(id:params[:id]) 
    #   else
    #     @resumes = Resume.published.find_by(pinned: true) 
    #   end
    # else 
    #   @resumes = Resume.published
    # end
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
    @resume.destroy
    redirect_to my_resumes_path , alert: "刪除成功"
  end

  def edit

  end

  def update
    
    if @resume.update(params_resume)
      redirect_to my_resumes_path , notice: "更新成功"
    else
      render :edit
    end
  end

  def pin
    current_user.resumes.update_all("pinned = false")
    @resume.update(pinned: true) 
    redirect_to my_resumes_path , notice: "預設成功"
  end


private

  def params_resume
    params.require(:resume).permit(:title ,:mugshot, :content , :status)
  end

  def resume_find
    @resume = if user_signed_in?
      current_user.resumes.friendly.find(params[:id])
    else
      # Resume.published.friendly.find(params[:id] , pinnde: true)
      Resume.published.friendly.find(params[:id])  
    end
  end
  

  def find_my_resume
    # @resume = Resume.find_by!(id: params[id] , user_id: current_user.id)
    @resume = current_user.resumes.friendly.find(params[:id])
  end
end
