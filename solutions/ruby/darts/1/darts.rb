class Darts
    def initialize(x, y)
        distance = Math.sqrt(x**2 + y**2)
        @score = case distance
        when 0..1
            10
        when 1..5
            5
        when 5..10
            1
        else
            0
        end
    end

    def score
        @score
    end
end