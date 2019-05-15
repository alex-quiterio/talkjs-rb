$:.unshift File.dirname(__FILE__)

require 'talkjs/v1/base'
require 'talkjs/v1/user'
require 'talkjs/v1/users/conversation'
require 'talkjs/v1/conversation'
require 'talkjs/v1/conversations/message'
require 'talkjs/v1/conversations/participant'


module Talkjs
  class << self;
    attr_accessor :api_id, :api_secret_key
  end

  URL = ENV['TALKJS_API_ENDPOINT'] || 'https://api.talkjs.com'
end