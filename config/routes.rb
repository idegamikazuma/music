Rails.application.routes.draw do
  get 'posts/:id/upload_form' => "posts#upload_form"
  post 'posts/:id/upload' => 'posts#upload'
  get 'posts/:id/show' => 'posts#show'

  get 'user/login_form' => "user#login_form"
  post 'user/login' => "user#login"
  get 'user/singup' => "user#singup"
  post 'user/create' => 'user#create'
  get 'user/:id/edit_form' => 'user#edit_form'
  post 'user/:id/edit' => 'user#edit'
  get "user/:id" => "user#show"
  post "user/logout" => "user#logout"

  get '/' => 'home#top'
end
