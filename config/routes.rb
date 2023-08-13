Rails.application.routes.draw do

# 管理者側ルーティング
  namespace :admin do
  get '/' => 'homes#top' 
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  
# 会員側ルーティング
  scope module: :customer do
  root :to =>"homes#top" 
  end
  devise_for :customers, controllers: {
    sessions:      'customer/sessions',
    passwords:     'customer/passwords',
    registrations: 'customer/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

