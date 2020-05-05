#require "covid/version"
require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "./covid/version"
require_relative './covid/scraper'
require_relative './covid/cli'

module Covid
  class Error < StandardError; end
end
