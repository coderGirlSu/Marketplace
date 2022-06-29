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

  enum colour: {
    black: 1,
    white: 2,
    grey: 3,
    cream: 4,
    beige: 5,
    baby_blue: 6,
    blue_green: 7,
    royal: 8,
    navy: 9,
    gold: 10,
    yellow: 11,
    silver: 12,
    pink: 13,
    purple: 14,
    red: 15,
    green: 16,
    orange: 17
  }
  
end
