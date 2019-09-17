class BooksController < ApplicationController
  def index
    @books = Book.all.order("id ASC")
    @book = Book.new
  end

  def create
      # book = Book.new(book_params)
      # if book.save
      #   flash[:notice]= "Book was successfully created."
      #   redirect_to book_path(book.id)
      # else
      #   flash[:notice]= "Title can't be blank"
      #   redirect_to books_path
      # end

      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(book.id)
      else
        flash[:blank] = 'Cannot be blank.'
        redirect_to books_path

      # @book = Book.new(book_params)
      #  @book.save
      #   flash[:notice] = "Book was successfully created."
      #   redirect_to books_path
      # else
      #   render action: :index
      # end

    # book = Book.new(book_params)
    # book.save
    # flash[:notice] = "Book was successfully created"
    # redirect_to book_path(book)

  end

  def show
      @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(params[:id])
  	flash[:notice] = "Book was successfully updated"
  end

  def destroy
    book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  	flash[:notice] = "Book was successfully destroyed"
  end
  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
