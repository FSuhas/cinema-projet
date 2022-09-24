class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]


  def index
    @user = current_user
    @books = Book.where(user_id: current_user)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @book.save
    redirect_to books_path
  end

  def show
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:id, :titre, :user_id, photos: [])
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
