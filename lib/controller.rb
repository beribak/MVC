require_relative 'view'
require_relative 'recipe'

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
        # 3 create an instance of a recipe
        recipe = Recipe.new(name, decs)
        # add the instance to the repo
        @cookbook.add_recipe(recipe)
    end 

    def destroy
        # 1 show all recipes
        list
        # 2 ask user for index to delete
        index = @view.ask_for_index
        # 3 delete recipe
        @cookbook.destroy(index)
    end

end