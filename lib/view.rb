class View 
    def display(recipes) 
        recipes.each_with_index do |recipe, index|
            puts "#{index + 1} #{recipe.name} #{recipe.description} #{recipe.prep_time}"
            puts "\n"
        end
    end

    def ask_for_name 
        puts "What recipe do you eant ot add?"
        gets.chomp
    end

    def ask_for_prep_time 
        puts "Prep Time?"
        gets.chomp
    end

    def ask_for_desc 
        puts "Description?"
        gets.chomp
    end

    def ask_for_index 
        puts "Index?"
        gets.chomp.to_i - 1
    end

    def ask_for_new_description 
        puts "Input new description"
        gets.chomp
    end

    def ask_for_ingridient 
        puts "Ingridient?"
        gets.chomp
    end
end