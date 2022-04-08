Rails.application.routes.draw do

  get "/resumes" , to: "resumes#index"
  get "/resumes/new" , to: "resumes#new"

  root 'pages#home'
end
