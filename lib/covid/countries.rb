class Covid::Countries

    attr_accessor :name
    @all = []


    def initialize(name)
        @name = name
    end

    def self.top
        countries = Covid::Scraper.scrape_countries
        countries.each do |country|
            country_obj = Covid::Countries.new(country)
            @all << country_obj.name
        end
        top = @all.take(10)
    end

    def self.top_sorted
        @all.take(10).sort
    end

    #countries should have a name attr, another option for example list alphabetically 

#     def self.top
#         countries = Covid::Scraper.scrape_countries
#         top = countries.slice!(0,10)
#         top
#     end

end
