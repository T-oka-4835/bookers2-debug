class Room < 
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy 
end
