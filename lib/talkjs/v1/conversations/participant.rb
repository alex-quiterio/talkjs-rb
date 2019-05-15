module Talkjs
  module V1
    module Conversations
      class Participant < Talkjs::V1::Base
        RESOURCE_NAME = 'participants'.freeze
        # PUT /conversations/:conversation_id/participants/:user_id
        # Creates a participant for a conversation_id with a :user_id
        # reference: https://talkjs.com/docs/Reference/REST_API/Reference/Participation.html#page_Join-conversation
        def self.create(conversation_id, user_id, payload)
          new(:put, "conversations/#{conversation_id}/#{RESOURCE_NAME}/#{user_id}", {}, payload).call
        end

        # PATCH /conversations/:conversation_id/participants/:user_id
        # Modity participation in a conversation
        # reference: https://talkjs.com/docs/Reference/REST_API/Reference/Participation.html#page_Modify-participation
        def self.update(conversation_id, user_id, payload)
          new(:patch, "conversations/#{conversation_id}/#{RESOURCE_NAME}/#{user_id}", {}, payload).call
        end

        # DELETE /conversations/:conversation_id/participants/:user_id
        # Leave conversation for a user_id
        # reference: https://talkjs.com/docs/Reference/REST_API/Reference/Participation.html#page_Leave-conversation
        def self.delete(conversation_id, user_id)
          new(:delete, "conversations/#{conversation_id}/#{RESOURCE_NAME}/#{user_id}").call
        end
      end
    end
  end
end
