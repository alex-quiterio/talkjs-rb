require 'httpclient'
require 'json'

module Talkjs
  module V1
    class Base
      class TalkjsError < StandardError;
      end
      attr_reader :http_verb_method, :endpoint, :query, :body

      def initialize(http_verb_method, endpoint, query = {}, body = {})
        @http_verb_method = http_verb_method
        @endpoint = endpoint
        @query = query
        @body = body
        @trial = 0

        @client = HTTPClient.new
        @client.connect_timeout = Talkjs.configuration.connect_timeout
        @client.send_timeout = Talkjs.configuration.send_timeout
        @client.receive_timeout = Talkjs.configuration.receive_timeout
      end

      def call
        parameters = {
          :query => query,
          :body => body.to_json,
          :header => Talkjs.configuration.headers
        }

        begin
          response = @client.send(http_verb_method, url, parameters)
          body = response.body ? JSON.parse(response.body) : ''

          {
            meta: { status: response.status },
            data: { body: body }
          }
        rescue HTTPClient::ConnectTimeoutError
          {
            meta: { code: response.status }
          }
        rescue HTTPClient::SendTimeoutError
          {
            meta: { code: response.status }
          }
        rescue HTTPClient::ReceiveTimeoutError
          {
            meta: { code: response.status }
          }
        rescue JSON::ParserError
          {
            meta: { code: 500 },
            data: { body: response.body }
          }
        end
      end

      private

      def url
        "#{Talkjs::URL}/v1/#{Talkjs.configuration.app_id}/#{endpoint}"
      end
    end
  end
end
