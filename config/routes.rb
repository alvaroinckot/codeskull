Rails.application.routes.draw do

  scope "(:locale)", locale: /pt-BR|en/ do
    root 'welcome#index'
    get '/dashboard' => 'dashboard#index' 
  end

end
