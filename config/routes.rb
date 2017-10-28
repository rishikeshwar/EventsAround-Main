Rails.application.routes.draw do
  #get 'admin/index'

  #get 'sessions/new'
  get 'auth/:provider/callback', to: 'sessions#creategoogle'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroygoogle', as: 'signoutgoogle'
  resources :sessions, only: [:creategoogle, :destroygoogle]


  get 'sessions/create'

  get 'sessions/destroy'

  get 'admin' => 'admin#index'

  controller :sessions do 
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end

  root 'home#index'
  resources :users do 
    resources :events 
    get 'personalinfos' => 'personalinfos#index'
    resources :personalinfos, only: [:show, :create, :edit]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
