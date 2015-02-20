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

    def self.delete_user(user_id)
      @@users.delete user_id
    end
  end
end
