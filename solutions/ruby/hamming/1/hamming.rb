=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
  class << self
    def compute(a, b)
      raise ArgumentError if a.length != b.length

      distance = 0

      a.each_char.with_index do |chr, i|
        if b[i] != chr
          distance += 1
        end
      end

      distance
    end
  end
end
