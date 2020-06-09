class Covid::Countries


    def self.top
        countries = Covid::Scraper.scrape_countries
        top = countries.slice!(0,10)
        top
    end

end