class HomesController < ApplicationController
  def top
    @books = Book.order("RANDOM()").limit(4)
    @ranks = Book.find(Favorite.group(:book_id).order('count(book_id) desc').limit(4).pluck(:book_id))
  end
  
  def search 
    @book = Book.search(params[:search])
  end 

  def about
  end
end
