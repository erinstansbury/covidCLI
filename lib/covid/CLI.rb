require_relative "../covid/scraper.rb"
require 'nokogiri'
require 'colorize'


class CLI


    Scraper.intro

    Scraper.menu


end

#   doc = Nokogiri::HTML(open("https://www.worldometers.info/coronavirus"))   
#   world = doc.css('div.panel-body div.number-table-main')[0].text
