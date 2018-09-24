class Recipe < ApplicationRecord
    def cook_time_min
        cook_time.to_s + ' minutos'
    end 
end
