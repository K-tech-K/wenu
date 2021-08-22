class Menu < ApplicationRecord
  belongs_to :user
  
 # バリデーション
  # contents
  validates :content, presence: true, length: { maximum: 255 }
  
  # category
  validates :category, presence: true, length: { maximum: 10 }
  
  # price
  validates :price, presence: true, numericality: true, length: { maximum: 4 }
  
end
