Rails.application.routes.draw do

  resource :messages do
    collection do
      post 'reply'
      post 'send'
    end
  end

  resources :todos do
    resources :items
  end
	
	post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  
end