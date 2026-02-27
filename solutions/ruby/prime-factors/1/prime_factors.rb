=begin
Write your code for the 'Prime Factors' exercise in this file. Make the tests in
`prime_factors_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/prime-factors` directory.
=end

class PrimeFactors
  def self.of(amount, min = 2)
    return [] if amount <= 1

    factor = first_factor(amount, min)

    [factor] + of(amount / factor, factor)
  end

  def self.first_factor(n, min = 2)
    min.upto(n).find { |i| n % i == 0 }
  end
end
