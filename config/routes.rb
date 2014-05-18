Bookwriter::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'books#index'

  get 'books/treeview', to: 'books#treeview', as: :books_treeview

  resources :books do
    get :treeview
    get 'export/:type', to: 'books#export', as: :export

    resources :chunks do
      put :position
    end
  end

  devise_for :users, :path => 'accounts'
end