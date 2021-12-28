Rails.application.routes.draw do
  root 'index#input'
  get '/output', :to => 'index#output', :as => 'index_output'
  get 'index', to: 'index#all', as: :index_all
  
end
