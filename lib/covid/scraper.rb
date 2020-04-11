
require 'nokogiri'
require 'open-uri'
require 'colorize'

class Scraper
    attr_accessor :confirmed, :currently_affected, :mild, :serious

    def self.intro
        puts "Here is your Covid19 news.".light_blue
        puts "--------------------------"
       
    end

    def self.prompt
        puts "What other statistics would you like to view?".light_blue
        input = gets.strip.downcase
        if input == "cases"
            Scraper.scrape_worldwide
            Scraper.prompt
        elsif input == "deaths"
            Scraper.scrape_deaths
            Scraper.prompt
        elsif input == "recovered"
            Scraper.scrape_recovered
            Scraper.prompt
        elsif input == "top"
            Scraper.scrape_countries
            Scraper.prompt
        else input == "exit"
            Scraper.goodbye
        end
    end

    def self.menu
        puts "-- Type 'cases' for the number of confirmed cases worldwide"
        puts "-- Type 'deaths' for the number of Covid-related deaths worldwide"
        puts "-- Type 'recovered' for the number of reported virus recoveries"
        puts "-- Type 'top' for the list of the top ten countries affected by Covid"
        puts "To exit, just type 'exit'"
        input = gets.strip.downcase
    
        if input == "cases"
            Scraper.scrape_worldwide
        elsif input == "deaths"
            Scraper.scrape_deaths
            Scraper.prompt
        elsif input == "recovered"
            Scraper.scrape_recovered
            Scraper.prompt
        elsif input == "top"
            Scraper.scrape_countries
            Scraper.prompt
        else input == "exit"
            Scraper.goodbye
        end
    end

    def self.scrape_worldwide
        doc = Nokogiri::HTML(open("https://www.worldometers.info/coronavirus"))
        world = self.new

        world.confirmed = doc.css('div.maincounter-number')[0].text.strip 
        world.currently_affected = doc.css('div.panel-body div.number-table-main')[0].text 
        world.mild = doc.css('span.number-table')[0].text.strip
        world.serious = doc.css('span.number-table')[1].text.strip
    

        puts "There are " + "#{world.confirmed}".yellow + " confirmed Coronavirus cases.\n\n"
        puts "To drill into the confirmed cases data type 'see more',\nor type 'menu' to return to the previous menu."
        input = gets.strip.downcase
        if input == "see more"
            puts "\nCurrently Affected Patients: #{world.currently_affected}"
            puts "#{world.mild} in" + " Mild".light_magenta + " Condition"
            puts "#{world.serious} in " + "Serious".red + " Condition"
            Scraper.prompt
        else input == "menu"
            Scraper.prompt
        end
    end

    def self.scrape_deaths
        doc = Nokogiri::HTML(open("https://www.worldometers.info/coronavirus"))
        deaths = doc.css('div.maincounter-number')[1].text.strip
        puts "There are " + "#{deaths}".red + " confirmed Coronavirus related deaths.\n\n"
    end

    def self.scrape_recovered
        doc = Nokogiri::HTML(open("https://www.worldometers.info/coronavirus"))
        recovered = doc.css('div.maincounter-number')[1].text.strip
        puts "There have been " + "#{recovered}".green + " instances of Coronavirus recoveries.\n\n"
    end

    def self.scrape_countries
        countries = []
        doc = Nokogiri::HTML(open('https://www.worldometers.info/coronavirus/#countries'))
        countries << doc.css('a.mt_a')[0].text
        countries << doc.css('a.mt_a')[1].text
        countries << doc.css('a.mt_a')[2].text
        countries << doc.css('a.mt_a')[3].text
        countries << doc.css('a.mt_a')[4].text
        countries << doc.css('a.mt_a')[5].text
        countries << doc.css('a.mt_a')[6].text
        countries << doc.css('a.mt_a')[7].text
        countries << doc.css('a.mt_a')[8].text
        countries << doc.css('a.mt_a')[9].text

        puts "The top 10 countries with the most confirmed cases are:"
        countries.each.with_index(1) do |country, i|
            puts "#{i}.".red + " #{country}"
        end
        puts ""
    end

    def self.goodbye
            puts "* * Wash your hands and remember we are all in this together! * *".light_magenta
    
    end

end

