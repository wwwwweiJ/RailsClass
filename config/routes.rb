Rails.application.routes.draw do

  resources :resumes

  resource :users , only: [ :create ] do 
    get :sign_up
    get :sign_in
  end

  resources :sessions , only: [ :create , :destroy ] 
  root "resumes#index"
  get "/" , to: "pages#home"
  # get "/resumes" , to: "resumes#index"
  # get "/resumes/new" , to: "resumes#new"
  # post "/resumes" , to: "resumes#create"
  # get "/resumes/:id" , to: "resumes#show" , as: "resume"
  # delete "/resumes/:id" , to: "resumes#destroy"
  # get "/resumes/:id/edit" , to: "resumes#edit" , as:"edit_resume"
  # patch "/resumes/:id" , to:"resumes#update"
  # get "/users/sign_up" , to: "users#new"
  # post "/users" , to: "users#create"
end
