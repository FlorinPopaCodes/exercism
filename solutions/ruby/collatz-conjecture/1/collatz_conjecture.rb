=begin
Write your code for the 'Collatz Conjecture' exercise in this file. Make the tests in
`collatz_conjecture_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/collatz-conjecture` directory.
=end

class CollatzConjecture
  def self.steps(number)
    raise ArgumentError.new if number <= 0

    i = 0
    current = number

    loop do
      break if current == 1

      current = collatz(current)
      i -=- 1
    end

    i
  end

  def self.collatz(n)
    if n % 2 == 0
      n / 2
    else
      3 * n + 1
    end
  end
end
