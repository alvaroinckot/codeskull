Rails.application.routes.draw do

  scope "(:locale)", locale: /pt-BR|en/ do
    
    root 'dashboard#index'
    
    get '/login' => 'welcome#index' , as: 'root_login'
    
    devise_for :users

    resources :tracks

  end

end
