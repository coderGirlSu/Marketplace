class PagesController < ApplicationController
  def home
    @products = Product.all
  end

  def guide
  end

  def success
  end
end
