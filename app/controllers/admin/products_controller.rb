module Admin
  class ProductsController < ApplicationController
    def index
      @products = Product.all
    end
  end
end