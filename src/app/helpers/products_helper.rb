module ProductsHelper
    def format_condtion(condition)
        words = condition.split("_").map do |word| 
            word.capitalize
        end
        words.join(" ")
    end
end