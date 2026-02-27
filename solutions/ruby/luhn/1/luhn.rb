=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn
  def self.valid?(s)
    sum = 0
    i = 0

    s.reverse.each_char do |chr|
      return false unless chr.ord == 32 || (48 <= chr.ord && chr.ord <= 57)
      next if chr.ord == 32

      d = chr.to_i

      sum += d
      if i % 2 == 1
        sum += d
        sum -= 9 if d + d > 9
      end

      i += 1
    end

    return false if i <= 1

    sum % 10 == 0
  end
end
