Rails.application.routes.draw do
  # For details  on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise内で任意のルーティングだけを行う。
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords' }

namespace :user do
  resources :users, only: [:show, :edit, :update, :destroy] do
  get 'withdraw', on: :member
  delete 'destroy_withdraw', on: :member
  get 'follows' => 'relationships#follower', as: 'follows'
  get 'followers' => 'relationships#followed', as: 'followers'
  end
  # usersコントローラーのwithdrawアクションは未設定
  resources :posts do
  resources :post_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]do
  end
  resources :categories, only: [:show]
  resource :favorites, only: [:create, :destroy]
end
  get '/top', to:'user/homes#top'
  get '/about', to:'user/homes#about'
  # 検索結果表示ページ
  get '/search', to: 'user/searches#search'
    # フォローする
  post 'follow/:id' => 'user/relationships#create', as: 'follow'
  # フォロー外す
  delete 'unfollow/:id' => 'user/relationships#destroy', as: 'unfollow'

  namespace :admin do
  	resources :users, only: [:index, :show, :edit, :update]
  	resources :categories, except: [:show, :new]
  	resources :posts, only: [:index, :show, :destroy] do
  	resources :post_comments, only: [:destroy]
  	end
  	root :to => 'homes#top'
  end
end
