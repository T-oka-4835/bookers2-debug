class Home < ApplicationRecord
  def self.search(search)
    return Book.all unless search 
    Book.where(['content LIKE ?', "%{search}%"])
  end 
end
