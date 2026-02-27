=begin
Write your code for the 'List Ops' exercise in this file. Make the tests in
`list_ops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/list-ops` directory.
=end

class ListOps
    def self.arrays(input)
        result = 0

        input.each do
            result += 1
        end

        result
    end

    def self.reverser(input)
        result = []

        input.reverse_each do |el|
            result << el
        end
        
        result
    end

    def self.concatter(first_input, second_input)
        result = []

        first_input.each do |el|
            result << el
        end

        second_input.each do |el|
            result << el
        end

        result
    end

    def self.mapper(input)
        result = []

        input.each do |el|
            result << yield(el)
        end

        result
    end

    def self.filterer(input)
        result = []

        input.each do |el|
            result << el if yield(el)
        end

        result
    end

    def self.sum_reducer(input)
        result = 0

        input.each do |el|
            result += el
        end

        result
    end

    def self.factorial_reducer(input)
        result = 1

        input.each do |el|
            result *= el
        end

        result
    end
end