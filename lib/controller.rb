require_relative 'view'
require_relative 'recipe'
require_relative 'scraping'
require 'open-uri'
require 'nokogiri'

class Controller 
    def initialize(cookbook)
        @cookbook = cookbook
        @view = View.new
    end

    def list 
        recipes = @cookbook.all
        @view.display(recipes)
    end

    def create 
        # 1 get name 
        name = @view.ask_for_name
        # 2 get description
        decs = @view.ask_for_desc

        prep_time = @view.ask_for_prep_time
        # 3 create an instance of a recipe
        recipe = Recipe.new(name, decs, prep_time)
        # add the instance to the repo
        @cookbook.add_recipe(recipe)
    end 

    def destroy
        # 1 show all recipes
        list
        # 2 ask user for index to delete
        index = @view.ask_for_index
        # 3 delete recipe
        @cookbook.remove_recipe(index)
    end

    def update 
        # 1 display recipes for user VIEW
        list
        # 2 ask for index VIEW
        index = @view.ask_for_index
        # 3 ask for updated description VIEW
        desc = @view.ask_for_desc
        # 4 updating description REPOSITORY
        @cookbook.update(index, desc) 
    end

    def import  
        # 1 Make an HTTP request to the recipe’s website with our keyword
        # 2 Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
            # - ask user for keyword
        ingridient = @view.ask_for_ingridient 
            # - call allrecipes.com
        recipes = Scraping.call(ingridient)

        # 3 Display them in an indexed list
        @view.display(recipes)
        # Ask the user which recipe they want to import (ask for an index)
        index = @view.ask_for_index 
        # Add it to the Cookbook
        @cookbook.add_recipe(recipes[index])
    end
end