module Talkjs
  module V1
    class Conversation < Talkjs::V1::Base
      RESOURCE_NAME = 'conversations'.freeze

      # GET /conversations
      # Return all the user in the application
      # check filters @ https://talkjs.com/docs/Reference/REST_API/Reference/conversations.html#page_Listing-all-conversations-in-the-application
      def self.all(params = {})
        new(:get, "#{RESOURCE_NAME}", params).call
      end

      # GET /conversations/:user_id
      # Return a user with a given user_id
      def self.get(user_id)
        new(:get, "#{RESOURCE_NAME}/#{user_id}").call
      end

      # PUT /conversations/:user_id
      # Updates a user with the new payload
      def self.update(user_id, payload)
        new(:put, "#{RESOURCE_NAME}/#{user_id}", {}, payload).call
      end
    end
  end
end
