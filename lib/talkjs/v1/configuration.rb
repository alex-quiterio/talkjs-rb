module Talkjs
  module V1
    class Configuration
      attr_accessor :api_endpoint, :api_id, :api_secret_key
      attr_writer :connect_timeout, :send_timeout, :receive_timeout

      def initialize
        @api_endpoint = 'https://api.aftership.com'
        @headers = { 'Content-Type' => 'application/json' }
        @connect_timeout = @receive_timeout = 500 # milliseconds
        @send_timeout = 1000 # milliseconds
      end

      def connect_timeout
        to_seconds(@connect_timeout)
      end

      def send_timeout
        to_seconds(@send_timeout)
      end

      def receive_timeout
        to_seconds(@receive_timeout)
      end

      def headers
        @headers.merge('Authorization' => "Bearer #{api_secret_key}")
      end

      def headers= h
        @headers.merge!(h)
      end

      private

      def to_seconds(milliseconds)
        milliseconds.to_f / 1000
      end
    end
  end
end