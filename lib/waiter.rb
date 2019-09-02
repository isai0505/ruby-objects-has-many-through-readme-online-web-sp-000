class Waiter
  attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end

    def self.all
      @@all
    end

    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end

    def meals #In plain English, the customer is going to
      # look at all of the meals, and then select
      # only the ones that belong to them. Translated into code,
      # that could be written like the following:
      Meal.all.select do |meal|
      meal.customer == self
      end
    end

    def waiters
      meals.map do |meal|
      meal.waiter
      end
    end

end
