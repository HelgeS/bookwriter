class BooksController < ApplicationController
  layout 'books_and_chunks'
  before_filter :authenticate_user!
  before_filter :find_all_users, :only => [:new, :edit]

  # GET /books
  # GET /books.json
  def index
    @books = current_user.books

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  def treeview
    @books = current_user.books

    tree_objects = Array.new
    @books.each do |b|
      children = Array.new

      b.chunks.order("position ASC").each do |c|
        tree_chunk = {
            title: c.title,
            key: c.id,
            href: edit_book_chunk_path(b, c),
            position_url: book_chunk_position_path(b, c, "json")
        }
        children.push tree_chunk
      end

      tree_book = {
        title: "#{b.title} (#{b.edition})",
        key: b.id,
        folder: true,
        href: book_path(b),
        expanded: (params[:book_id].to_i == b.id),
        children: children
      }

      tree_objects.append(tree_book)
    end

    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: tree_objects }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html { render_check_template }# show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    params[:book][:user_ids] ||= []

    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
  def find_all_users
    @users = User.all
  end
end
