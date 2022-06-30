# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = ["Coat", "Jacket", "Sweater", "Top/Shirt", "T-shirt", "Polo", "Hoody", "Dress", "Skirt", "Shorts", "Pants", "Jeans", "Shoes", "Hat", "Bag", "Accessories"]

if Category.count == 0
    categories.each do |category|
        Category.create(name: category)
        puts "created #{category} category"
    end
end