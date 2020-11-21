require "pry"

class Customer
    attr_accessor :name, :age, :waiter, :total, :tip

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        arr = []
        Meal.all.each { |meal| arr << meal if meal.customer == self }
        arr
    end

    def waiters
        arr = []
        Meal.all.each { |meal| arr << meal.waiter if meal.customer == self }
        arr
    end

end
