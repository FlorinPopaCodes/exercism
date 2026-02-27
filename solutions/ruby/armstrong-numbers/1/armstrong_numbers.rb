=begin
Write your code for the 'Armstrong Numbers' exercise in this file. Make the tests in
`armstrong_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/armstrong-numbers` directory.
=end

class ArmstrongNumbers
  def self.include?(number)
    armstrong(split(number)) == number
  end

  def self.split(number)
    number.to_s.split('')
  end

  def self.armstrong(numbers)
    numbers.sum { |n| n.to_i ** numbers.size }
  end
end
