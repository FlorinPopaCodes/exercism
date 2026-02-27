=begin
Write your code for the 'Nth Prime' exercise in this file. Make the tests in
`nth_prime_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/nth-prime` directory.
=end

class Prime
  def self.nth(n)
    raise ArgumentError if n == 0

    primes = [nil, nil, *2..(20*n)]
    number_of_primes = 0

    (2..20*n).each do |i|
      if primes[i]
        ((i+i)..(20*n)).step(i) { |j| primes[j] = nil }
        number_of_primes += 1
      end

      break if number_of_primes == n
    end

    primes.compact.at(n-1)
  end
end
