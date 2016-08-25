Rails.application.routes.draw do

  resources :grades
  scope "(:locale)", locale: /pt-BR|en/ do
    
    root 'dashboard#index'
    
    get '/login' => 'welcome#index' , as: 'root_login'
    
    devise_for :users

    resources :tracks do
    	resources :tasks
    end
    resources :contents, only: [ :destroy ]

  end

end
