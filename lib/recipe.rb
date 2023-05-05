
class Recipe 
    attr_reader :description, :name
    
    def initialize(name, description)
        @description = description
        @name = name
    end
end