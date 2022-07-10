class PagesController < ApplicationController
  # show all products
  def home
    @products = Product.all
  end

  def guide
  end

  def success
  end
end
