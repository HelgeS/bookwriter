Bookwriter::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  # Startseite der Applikation
  root :to => 'books#index'

  # verschachtelte Ressourcen
  resources :books do
    resources :chunks
  end

  devise_for :users, :path => 'accounts'

  #resources :users


end