Rails.application.routes.draw do
  root "resumes#index"
  get "/" , to: "pages#home"
  resources :resumes do 
    collection do 
      get "/my" , to:"resumes#my" 
      get "/my/edit" , to:"resumes#edit"
      post "/my" , to:"resumes#update"
      delete "/my" , to:"resumes#destroy"
    end
  end




  resource :users , only: [ :create  ] do 
    get :sign_up
    get :sign_in
  end
  resource :sessions , only: [ :create , :destroy ] 
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
