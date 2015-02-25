Rails.application.routes.draw do
  get 'sessions/new'
  root 'homes#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
  end
  resources :news do
  end
  resources :article_stores do
    resources :articles
  end
  resources :book_stores do
    resources :books
  end
  resources :lecture_stores do
    resources :lectures
  end
  resources :rule_stores do
    resources :rules
  end
  resources :photo_stores do
    resources :photos
  end
end