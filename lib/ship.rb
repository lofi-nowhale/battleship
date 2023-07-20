class Ship
    attr_reader :name, :length, :health
    def initialize(name, length)
        @name = name
        @length = length
        @health = length
        #Not in love with this solution, let me know if you think there is a better way to store this attribute"
    end

    def sunk?
        health == 0
    end
    
end