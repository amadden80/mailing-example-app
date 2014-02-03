MailingApp::Application.routes.draw do

  devise_for :users

  root :to => "home#index"
  get '/shoot_mail' => 'home#shoot_mail'
  
end