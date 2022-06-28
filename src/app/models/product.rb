class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_rich_text :description

  enum condition: {
    as_new: 1,
    near_perfect_mint: 2,
    excellent: 3,
    very_good: 4,
    poor: 5
  }

  
end
