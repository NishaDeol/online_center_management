class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_book, only: [:show]
  before_action :get_user_book, only: [:edit, :update, :destroy]
  before_action :check_book_user, only: [:edit, :update, :destroy]

  def index
    @books = Book.order(created_at: :desc)
  end
  
  def create
    book = current_user.books.build(book_params)
    if book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def new
    @book = current_user.books.build
  end
  
  def show
  end
  
  def edit
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end
  
  def destroy
    if @book.destroy
      redirect_to books_path
    else
      render :new
    end
  end

  private

  def get_book
    @book = Book.find(params[:id])
  end

  def get_user_book
    @book = current_user.books.find(params[:id])
  end

  def check_book_user
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:name, :author, :title, :description, :price)
  end
end
