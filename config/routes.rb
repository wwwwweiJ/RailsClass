Rails.application.routes.draw do

  get "/resumes" , to: "resumes#index"
  get "/resumes/new" , to: "resumes#new"
  post "/resumes" , to: "resumes#create"

  root 'pages#home'
end
