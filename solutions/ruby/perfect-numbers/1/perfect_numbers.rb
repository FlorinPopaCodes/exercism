class PerfectNumber
    def self.classify(number)
        raise RuntimeError if number < 1

        sum = (1...number).select { |n| number % n == 0 }.sum

        case
        when sum < number 
            "deficient"
        when sum > number
            "abundant"
        else
            "perfect"
        end
    end
end