class BooksController < ApplicationController
  def index
    @books = Book.all.order("id ASC")
    @book = Book.new
  end

  def create
    # @book = Book.new(book_params)
    # if @book.save
    #   redirect_to book_path,
    #   notice: 'Book was successfully created.'
    # else
    #   render :new
    
    @book = Book.new(book_params)
    if @book.save # 保存できた場合
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else # 保存出来なかった場合
      @books = Book.all.order("id ASC")
     render :index
    end
   

  end
      # if @book.save
      #   flash[:notice] = "Book was successfully created."
      #   redirect_to book_path(book.id)
      # else
      #   flash[:blank] = 'Cannot be blank.'
      #   redirect_to books_path

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
