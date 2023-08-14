Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions:      'customer/sessions',
    passwords:     'customer/passwords',
    registrations: 'customer/registrations'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  # namespace :customer do
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  #   get 'customers/withdraw'
  # end
  
  # 管理者側ルーティング
  namespace :admin do
    get '/' => 'homes#top' 
  end

  
  # 会員側ルーティング
  scope module: :customer do
    root to: "homes#top"
    resources :maps, only: [:index]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'check_out'
        get 'withdraw'
        patch 'withdraw_update'
      end
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

