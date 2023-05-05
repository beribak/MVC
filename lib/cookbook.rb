require_relative 'recipe'
require 'csv'

class Cookbook 
    def initialize(csv_path)
        @csv_path = csv_path
        @recipes = []

        CSV.foreach(@csv_path) do |row|
            @recipes << Recipe.new(row[0], row[1])
        end
    end

    def all 
        @recipes
    end

    def remove_recipe(index) 
        @recipes.delete_at(index)
        save_csv 
    end

    def add_recipe(recipe) 
        @recipes << recipe
        save_csv 
    end

    private

    def save_csv 
        CSV.open(@csv_path, "wb") do |csv|
            @recipes.each do |recipe| 
                csv << [recipe.name, recipe.description]
            end
        end
    end
end

