require 'httpclient'
require 'json'

module Talkjs
  module V1
    class Base
      class TalkjsError < StandardError;
      end
      attr_reader :http_verb_method, :endpoint, :query, :body

      MAX_TRIAL = 3
      CALL_SLEEP = 3

      def initialize(http_verb_method, endpoint, query = {}, body = {})
        @http_verb_method = http_verb_method
        @endpoint = endpoint
        @query = query
        @body = body
        @trial = 0

        @client = HTTPClient.new
      end

      def call
        header = {
          'Authorization' => "Bearer #{Talkjs.api_secret_key}",
          'Content-Type' => 'application/json'
        }

        parameters = {
          :query => query,
          :body => body.to_json,
          :header => header
        }


        response = nil

        loop do
          response = @client.send(http_verb_method, url, parameters)

          if response.body
            begin
              response = JSON.parse(response.body)
              @trial = MAX_TRIAL + 1
            rescue
              @trial += 1

              sleep CALL_SLEEP

              response = {
                  :meta => {
                      :code => 500,
                      :message => 'Something went wrong on Talkjs\'s end.',
                      :type => 'InternalError'
                  },
                  :data => {
                      :body => response.body,
                      :cf_ray => cf_ray
                  }
              }
            end
          else
            response = {
                :meta => {
                    :code => 500,
                    :message => 'Something went wrong on Talkjs\'s end.',
                    :type => 'InternalError'
                },
                :data => {
                }
            }
          end

          break if @trial > MAX_TRIAL
        end

        response
      end

      private

      def url
        "#{Talkjs::URL}/v1/#{Talkjs.api_id}/#{endpoint}"
      end

    end
  end
end
