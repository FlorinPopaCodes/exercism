=begin
Write your code for the 'Pythagorean Triplet' exercise in this file. Make the tests in
`pythagorean_triplet_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pythagorean-triplet` directory.
=end

# Triplet = Struct.new(:a, :b, :c)
class Triplet
  attr_accessor :a, :b, :c
  
  def initialize(a, b, c)
    self.a = a
    self.b = b
    self.c = c
  end
  
  def sum
    a + b + c
  end
  
  def product
    a * b * c
  end
  
  def pythagorean?
    a * a + b * b === c * c
  end
  
  def self.where(min_factor: 2, max_factor:, sum: nil)
    results = []

    min_factor.upto(max_factor-2) do |a|
      [min_factor + 1, a + 1].max.upto(max_factor-1) do |b|
        [min_factor + 2, b + 1 ].max.upto(max_factor) do |c|
          current = self.new(a,b,c)

          next unless current.pythagorean?
          next if sum != nil && current.sum != sum
          
          results << current 
        end
      end
    end

    results
  end
end