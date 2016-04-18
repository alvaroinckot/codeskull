Rails.application.routes.draw do
  resources :controllers

  scope "(:locale)", locale: /pt-BR|en/ do
    root 'welcome#index'
  end

end
