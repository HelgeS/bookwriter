Bookwriter::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'books#index'

  get 'books/treeview', to: 'books#treeview', as:'books_treeview'

  resources :books do
    get :treeview

    resources :chunks do
      put :position
    end
  end

  devise_for :users, :path => 'accounts'
end