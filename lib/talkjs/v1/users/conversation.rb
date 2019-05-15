module Talkjs
  module V1
    module Users
      class Conversation < Talkjs::V1::Base
        # GET /users/:user_id/conversations
        # Return a list of conversations for a user
        def self.all(user_id, params = {})
          new(:get, "#{RESOURCE_NAME}/#{user_id}/conversations", params).call
        end
      end
    end
  end
end
