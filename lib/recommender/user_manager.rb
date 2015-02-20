# User Manager for the Recommender
#
require 'recommender/user'
require 'recommender/engine'

module Recommender
  class UserManager
    @@users = {}

    def self.find_or_create_user(user_id)
      @@users[user_id] = ::Recommender::User.new if @@users[user_id].nil?

      @@users[user_id]
    end

    def self.recommendations_for(user_id)
      if current_user = @@users[user_id]
        other_users = @@users.reject { |key| key == user_id }.values
        ::Recommender::Engine.new(current_user).product_recommendations(*other_users)
      else
        []
      end
    end

    def self.delete_user(user_id)
      @@users.delete user_id
    end
  end
end
