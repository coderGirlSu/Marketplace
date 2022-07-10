class Category < ApplicationRecord
    # category has many products
    has_many :products
end
