Movtriv::Application.routes.draw do
  devise_for :admins

  resources :movies

  post "check"  => "questions#check"
  root :to      => "questions#play"
end
