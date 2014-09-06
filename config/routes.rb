Bookwriter::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'books#index'

  get 'books/treeview' => 'books#treeview', as: :books_treeview

  resources :books do
    get :treeview
    get :export

    resources :chunks do
      put :position

      get 'versions/:version_id/diff' => 'chunks#diff', as: 'diff_version'
      post 'versions/:version_id/revert' => 'chunks#revert', as: 'revert_version'
    end
  end

  devise_for :users, :path => 'accounts'
end