class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_role, only: %i[index]


  def index
    @user = current_user
    @books = Book.where(user_id: current_user)
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path
    else
      redirect_to books_path, alert: "Votre books n'a pu être ajouté", status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
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

  def set_role
    if current_user.role == "recruteur"
      redirect_to candidats_path
    end
  end

  def book_params
    params.require(:book).permit(:id, :titre, :user_id, photos: [])
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
