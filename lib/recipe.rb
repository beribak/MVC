
class Recipe 
    attr_accessor :description, :name
    
    def initialize(name, description)
        @description = description
        @name = name
    end
end