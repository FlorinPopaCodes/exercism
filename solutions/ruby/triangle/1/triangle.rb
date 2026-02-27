=begin
Write your code for the 'Triangle' exercise in this file. Make the tests in
`triangle_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/triangle` directory.
=end

class Triangle
  attr_accessor :sides, :uniq_sides

  def initialize(sides)
    self.sides = sides
    self.uniq_sides = sides.uniq
  end

  def equilateral?
    triangle? && self.uniq_sides.size == 1
  end

  def isosceles?
    triangle? && [1, 2].include?(self.uniq_sides.size)
  end

  def scalene?
    triangle? && self.uniq_sides.size == 3
  end

  def triangle?
    self.sides.size == 3 &&
    sides.none?(&:zero?) &&
    sides.permutation.none? do |a, b, c|
      a + b < c
    end
  end
end
