Bbtodo::Application.routes.draw do
  scope 'api' do
    resources :todos
  end
  
  root to: 'pages#index'
  
  match '*path', to: 'pages#index'
end
