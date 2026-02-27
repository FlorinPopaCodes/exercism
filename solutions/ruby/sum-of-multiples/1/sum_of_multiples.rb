=begin
Write your code for the 'Sum Of Multiples' exercise in this file. Make the tests in
`sum_of_multiples_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sum-of-multiples` directory.
=end
require 'set'

class SumOfMultiples
  attr_accessor :factors

  def initialize(*factors)
    self.factors = factors.reject(&:zero?)
  end

  def to(limit)
    result = Set.new
    size = 1

    while factors.combination(size).any? do
      factors.combination(size).each do |f|
        item = f.inject(:*)

        (item...limit).step(item).each do |i|
          result << i
        end
      end

      size += 1
    end

    result.sum
  end

end
