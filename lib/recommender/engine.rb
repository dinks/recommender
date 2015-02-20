# Engine for the recommender
#
# http://robertheaton.com/2014/05/02/jaccard-similarity-and-minhash-for-winners/
# https://moultano.wordpress.com/2010/01/21/simple-simhashing-3kbzhsxyg4467-6/
# http://en.wikipedia.org/wiki/MinHash
#
module Recommender
  class Engine
    # By Chernoff Bounds, the expected error is O(1/sqrt(MAX_PRODUCT_SAMPLE_SIZE))
    # So for bigger sets, this will be better
    MAX_USER_SAMPLE_SIZE = 20
    MAX_PRODUCT_SAMPLE_SIZE = 5
    MAX_RECOMMENDATIONS_PER_USER = 2
    MIN_RATIO_FOR_RECOMMENDATION_ACCEPTANCE = 0.0

    def initialize(user)
      @user = user
    end

    def product_recommendations(*users)
      users.sample(MAX_USER_SAMPLE_SIZE).map { |u|  product_recommendations_with(u) }.flatten.uniq
    end

    private

    def product_recommendations_with(user)
      ll = intersection_products_with(user).sample(MAX_RECOMMENDATIONS_PER_USER)
      if ( ll.length * 1.0 ) / MAX_RECOMMENDATIONS_PER_USER > MIN_RATIO_FOR_RECOMMENDATION_ACCEPTANCE
        user.products - ll
      else
        []
      end
    end

    def intersection_products_with(user)
      union_products_with(user) & sampled_for(@user.products) & sampled_for(user.products)
    end

    def union_products_with(user)
      union_products = sampled_for(@user.products) + sampled_for(user.products)
      sampled_for(union_products)
    end

    def sampled_for(products)
      products.sample(MAX_PRODUCT_SAMPLE_SIZE)
    end
  end
end
