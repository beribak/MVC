
class Recipe 
    attr_accessor :description, :name, :prep_time
    
    def initialize(name, description, prep_time)
        @description = description
        @name = name
        @prep_time = prep_time
    end
end