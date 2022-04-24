Rails.application.routes.draw do

get 'orders/show'
scope module: :public do
             resource :customers, only: [:edit, :show, :update]
            #  get "/customers/edit" => "customers#edit"
            #  get "/customers/mypage" => "customers#show"
            #  patch "/customers" => "customers#update"
             get "/customers/confirm" => "customers#confirm"
             patch "/customers/destroy" => "customers#destroy"
             
             resources :addresses, only: [:destroy, :update, :edit]
             get "/addresses" => "addresses#index"
             post "/addresses" => "addresses#create"
             
             get "/orders/thanks" => "orders#thanks"
             resources :orders, only: [:show, :new, :create]
             get "/orders" => "orders#index"
             get "/orders/clear" => "orders#clear"
             post "/orders/confirm" => "orders#confirm"
             
             resources :items, only: [:show]
             get "/items" => "items#index"
             
             resources :cart_items, only: [:update, :destroy]
             get "/cart_items" => "cart_items#index"
             
             delete "/cart_item/all_destroy" => "cart_items#all_destroy"
             post "/cart_items" => "cart_items#create"
end

get "/about" => "homes#about"     
root to: 'public/homes#top'
get "public" => "public/homes#about"

devise_for :customers, controllers: {
        sessions: 'customers/sessions',
        registrations: 'customers/registrations'}



devise_for :admin
        
namespace :admin do
         root to: 'homes#top'
         resources :genres, only: [:create, :index, :edit, :update]
         resources :items, only: [:new, :create, :index, :show, :edit, :update]
         resources :customers, only: [:show, :edit, :update]
         get "/customers" => "customers#index"
         resources :orders, only: [:show, :update]
         resources :order_details, only: [:update] 
end

namespace :public do
    root to: 'homes#top'
end

get "admin" => "admin#index"
get 'search' => 'posts#search'


resources :admin, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
end

end