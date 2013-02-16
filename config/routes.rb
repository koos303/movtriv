Movtriv::Application.routes.draw do
  resources :movies

  post "check"  => "questions#check"
  root :to      => "questions#play"
end
