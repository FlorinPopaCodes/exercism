=begin
Write your code for the 'Largest Series Product' exercise in this file. Make the tests in
`largest_series_product_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/largest-series-product` directory.
=end

class Series
    def initialize(input)
        @input = input
    end

    def largest_product(size)
        raise ArgumentError if size > @input.size
        raise ArgumentError if @input.match?(/\D/)
        
        return 1 if size == 0

        @input
            .chars
            .map(&:to_i)
            .each_cons(size)
            .map { |x| x.reduce(:*) }
            .max
    end
end