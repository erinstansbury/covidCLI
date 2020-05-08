#require "covid/version"
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'
require_relative "./covid/version"
require_relative './covid/scraper'
require_relative './covid/cli'
require_relative './covid/countries'

module Covid
  class Error < StandardError; end
end
