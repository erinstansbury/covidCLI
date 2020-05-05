
require 'nokogiri'
require 'open-uri'
require 'colorize'

class Scraper


    @doc = Nokogiri::HTML(open("https://www.worldometers.info/coronavirus"))


    def self.scrape_confirmed
        confirmed = @doc.css('div.maincounter-number')[0].text.strip 
        confirmed
    end

    def self.scrape_mild
        mild = @doc.css('span.number-table')[0].text.strip
        mild
    end

    def self.scrape_serious
        serious = @doc.css('span.number-table')[1].text.strip
        serious
    end

    def self.scrape_current
        currently_affected = @doc.css('div.panel-body div.number-table-main')[0].text
        currently_affected
    end

    def self.scrape_deaths
        deaths = @doc.css('div.maincounter-number')[1].text.strip
        deaths
    end

    def self.scrape_recovered
        recovered = @doc.css('div.maincounter-number')[1].text.strip
        recovered
    end

    def self.scrape_countries
        url = Nokogiri::HTML(open('https://www.worldometers.info/coronavirus/#countries'))
        country = []
        country << url.css('a.mt_a')[0].text
        country << url.css('a.mt_a')[1].text
        country << url.css('a.mt_a')[2].text
        country << url.css('a.mt_a')[3].text
        country << url.css('a.mt_a')[4].text
        country << url.css('a.mt_a')[5].text
        country << url.css('a.mt_a')[6].text
        country << url.css('a.mt_a')[7].text
        country << url.css('a.mt_a')[8].text
        country << url.css('a.mt_a')[9].text
        country
    end


end

