# frozen_string_literal: true

class BooksController < ApplicationController
  # GET /books
  def index
    @books = Book.order(:id).page(params[:page])
  end

  # GET /books/1
  def show
    @comment = Comment.new
    @book = Book.find(params[:id]) if Book.exists?(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id]) if Book.exists?(params[:id])
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: t('controllers.common.notice_create', name: Book.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    @book = Book.find(params[:id]) if Book.exists?(params[:id])
    if @book&.update(book_params)
      redirect_to @book, notice: t('controllers.common.notice_update', name: Book.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book = Book.find(params[:id]) if Book.exists?(params[:id])
    @book&.destroy
    redirect_to books_url, notice: t('controllers.common.notice_destroy', name: Book.model_name.human)
  end

  private

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end
end
