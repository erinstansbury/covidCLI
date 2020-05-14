
class Covid::CLI

    def self.intro
        puts "Here is your Covid19 news.".light_blue
        puts "--------------------------"
        menu
    end


    def self.worldwide
        confirmed = Covid::Scraper.scrape_confirmed
        puts "There are " + "#{confirmed}".yellow + " confirmed Coronavirus cases.\n\n"
        puts "To drill into the confirmed cases data type 'see more',\nor type 'menu' to return to the previous menu."
        input = gets.strip.downcase
        if input == "see more"
            drill_down
            prompt
        elsif input == "menu"
            menu
        else input == "exit"
            goodbye
        end
    end

    def self.drill_down
        current = Covid::Scraper.scrape_current
        mild = Covid::Scraper.scrape_mild
        serious = Covid::Scraper.scrape_serious
            puts "\nCurrently Affected Patients:" + "#{current}".yellow
            puts "#{mild} in" + " Mild".light_magenta + " Condition"
            puts "#{serious} in " + "Serious".red + " Condition"
    end


    def self.menu
        puts "-- Type 'cases' for the number of confirmed cases worldwide"
        puts "-- Type 'deaths' for the number of Covid-related deaths worldwide"
        puts "-- Type 'recovered' for the number of reported virus recoveries"
        puts "-- Type 'top' for the list of the top ten countries affected by Covid"
        puts "To exit, just type 'exit'"
        input = gets.strip.downcase
    
        if input == "cases"
            worldwide
        elsif input == "deaths"
            deaths
            prompt
        elsif input == "recovered"
            recovered
            prompt
        elsif input == "top"
            top_ten
            prompt
        else input == "exit"
            goodbye
        end
    end

    def self.prompt
        puts "What other statistics would you like to view?".light_blue
        input = gets.strip.downcase
        if input == "cases"
            worldwide
        elsif input == "deaths"
            deaths
            prompt
        elsif input == "recovered"
            recovered
            prompt
        elsif input == "top"
            top_ten
            prompt
        else input == "exit"
            goodbye
        end
    end

    def self.deaths
        deaths = Covid::Scraper.scrape_deaths
        puts "There are " + "#{deaths}".red + " confirmed Coronavirus related deaths.\n\n"
    end

    def self.recovered
        recovered = Covid::Scraper.scrape_recovered
        puts "There have been " + "#{recovered}".green + " instances of Coronavirus recoveries.\n\n"
    end

    def self.goodbye
        puts "* * Wash your hands and remember we are all in this together! * *".light_magenta
    end

    def self.top_ten
        puts "The top 10 countries with the most confirmed cases are:"
        country = Covid::Countries.top
        country.each.with_index(1) do |country, i|
           puts "#{i}.".red + " #{country}"
        end
        puts ""
    end


end

