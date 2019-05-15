module Talkjs
  module V1
    class User < Talkjs::V1::Base
      RESOURCE_NAME = 'users'.freeze

      # GET /users
      # Return all the user in the application
      # check filters @ https://talkjs.com/docs/Reference/REST_API/Reference/Users.html#page_Listing-all-users-in-the-application
      def self.all(params = {})
        new(:get, "#{RESOURCE_NAME}", params).call
      end

      # GET /users/:user_id
      # Return a user with a given user_id
      def self.get(user_id)
        new(:get, "#{RESOURCE_NAME}/#{user_id}").call
      end

      # PUT /users/:user_id
      # Updates a user with the new payload
      def self.update(user_id, payload)
        new(:put, "#{RESOURCE_NAME}/#{user_id}", {}, payload).call
      end
    end
  end
end
