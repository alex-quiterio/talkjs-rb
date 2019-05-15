module Talkjs
  module V1
    module Conversations
      class Message < Talkjs::V1::Base
        RESOURCE_NAME = 'messages'.freeze
        # GET /conversations/:conversation_id/messages
        # Return all the user in the application
        # check filters @ https://talkjs.com/docs/Reference/REST_API/Reference/conversations.html#page_Listing-all-conversations-in-the-application
        def self.all(conversation_id, params = {})
          new(:get, "conversations/#{conversation_id}/#{RESOURCE_NAME}", params).call
        end

        # PUT /conversations/:user_id
        # Updates a user with the new payload
        def self.create(conversation_id, payload)
          new(:put, "conversations/#{conversation_id}/#{RESOURCE_NAME}", {}, payload).call
        end

        # PUT /conversations/:user_id
        # Updates a user with the new payload
        def self.update(user_id, payload)
          new(:put, "#{RESOURCE_NAME}/#{user_id}", {}, payload).call
        end
      end
    end
  end
end
