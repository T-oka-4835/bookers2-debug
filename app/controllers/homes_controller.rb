class HomesController < ApplicationController
  def top
    @books = Book.order("RANDOM()").limit(4)
  end

  def about
  end
end
