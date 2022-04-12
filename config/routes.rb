Rails.application.routes.draw do

  root "resumes#index"
  get "/resumes" , to: "resumes#index"
  get "/resumes/new" , to: "resumes#new"
  post "/resumes" , to: "resumes#create"
  get "/resumes/:id" , to: "resumes#show" , as: "resume"
  delete "/resumes/:id" , to: "resumes#destroy"
  get "/resumes/:id/edit" , to: "resumes#edit" , as:"edit_resume"
  patch "/resumes/:id" , to:"resumes#update"
  
end
