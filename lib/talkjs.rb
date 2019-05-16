$:.unshift File.dirname(__FILE__)

require 'talkjs/v1/configuration'
require 'talkjs/v1/base'
require 'talkjs/v1/user'
require 'talkjs/v1/users/conversation'
require 'talkjs/v1/conversation'
require 'talkjs/v1/conversations/message'
require 'talkjs/v1/conversations/participant'


module Talkjs
  class << self;
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Talkjs::V1::Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  URL = ENV['TALKJS_API_ENDPOINT'] || 'https://api.talkjs.com'
end