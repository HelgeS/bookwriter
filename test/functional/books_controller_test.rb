require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
    @user = users(:one)
  end

  test "should get index" do
    sign_in :user, @user
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    sign_in :user, @user
    get :new
    assert_response :success
  end

  test "should create book" do
    sign_in :user, @user
    assert_difference('Book.count') do
      post :create, book: { abstract: @book.abstract, edition: @book.edition, genre: @book.genre, published: @book.published, tags: @book.tags, title: @book.title }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    sign_in :user, @user
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    sign_in :user, @user
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    sign_in :user, @user
    put :update, id: @book, book: { abstract: @book.abstract, edition: @book.edition, genre: @book.genre, published: @book.published, tags: @book.tags, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    sign_in :user, @user
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
