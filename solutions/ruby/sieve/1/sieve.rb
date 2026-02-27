=begin
Write your code for the 'Sieve' exercise in this file. Make the tests in
`sieve_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sieve` directory.
=end

class Sieve
  def initialize(size)
    @size = size
  end

  def primes
    return []  if @size <= 1
    return [2] if @size == 2

    result = (3..@size).step(2).to_a

    result.each_with_index do |item, index|
      result = result[0..index] + result[index..-1].reject { |i| i % item == 0 }
    end

    [2] + result.uniq
  end
end
