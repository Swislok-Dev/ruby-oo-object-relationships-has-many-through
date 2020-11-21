
class Waiter
    attr_accessor :name, :years, :customer, :total, :tip

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end
    
    def meals
        arr = []
        Meal.all.each do |meal|
            if meal.waiter == self
                arr << meal
            end
        end
        arr
    end

    def best_tipper
        best_tip = nil
        tip = 0
        Meal.all.each do |meal|
            if meal.tip > tip
                best_tip = meal.customer
                tip = meal.tip
            end
        end
        best_tip
    end
end
