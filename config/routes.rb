Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # We want to see multiple products
  resources :products do 
    resources :order_items
  end 

  # This resources means I can use urls like /pages/1.
  # I can now access the /1 using params[:id]
  resources :pages

  # We want our users to make multiple order(s)
  resources :orders

  # A user should only see one (1) cart
  resource :cart
  
  get "info", to: "pages#info"

  root "pages#home"

end
