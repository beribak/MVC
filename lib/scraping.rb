require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Scraping 

    def self.call(keyword)
        recipes = []
        url = "https://www.allrecipes.com/search?q=#{keyword}"
        html_file = URI.open(url).read
        html_doc = Nokogiri::HTML.parse(html_file)
        # comp mntl-card-list-items mntl-document-card mntl-card card card--no-image
        html_doc.search(".mntl-document-card.card").each do |element|
            if element.search(".icon-star").count > 0 
                title = element.search(".card__title-text").text

                url1 = element.attr("href")
                html_file1 = URI.open(url1).read
                html_doc1 = Nokogiri::HTML.parse(html_file1)
                
                desc = html_doc1.search(".comp.article-subheading").text
                prep = html_doc1.search(".mntl-recipe-details__value")[0].text
           
                recipes << Recipe.new(title, desc, prep)
            end
        end 

        return recipes.first(5)
    end
end
