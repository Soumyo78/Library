class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:update, :show, :destroy]

  def index
    books = Book.includes([:author, :book_copies]).page(params[:page])
    render json: books, meta: { message: "All books have been loaded" }, adapter: :json, status: 200
  end

  def show
    render json: @book, meta: { message: "Book has been loaded" }, adapter: :json, status: 302
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book, meta: { message: "Book has been created successfully" }, adapter: :json, status: 201
    else
      render json: { error: user.errors, message: "Failed to create Book." }, adapter: :json, status: 422
    end
  end

  def update
    if @book.update(book_params)
      render json: @book, meta: { message: "Book has been updated successfully" }, adapter: :json, status: 200
    else
      render json: { error: @book.errors, message: "Failed to update Book." }, adapter: :json, status: 422
    end
  end

  def destroy
    if @book.destroy
      render json: { message: "Book has been deleted successfully" }, adapter: :json, status: 200
    else
      render json: { error: @book.errors, message: "Failed to delete Book." }, adapter: :json, status: 422
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author_id)
    end
end
