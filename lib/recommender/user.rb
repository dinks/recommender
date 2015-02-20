# User class for the Recommender
#
module Recommender
  class User
    attr_accessor :products

    def initialize
      @products = []
    end

    # Add Product to the list
    #
    def add_product(product_id)
      @products << product_id unless @products.include?(product_id)
    end
  end
end
