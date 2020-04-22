require_relative "../covid/scraper.rb"
require 'nokogiri'
require 'colorize'


class CLI

    puts "Here is your Covid19 news.".light_blue
    puts "--------------------------"

    
    Scraper.menu
    
end

