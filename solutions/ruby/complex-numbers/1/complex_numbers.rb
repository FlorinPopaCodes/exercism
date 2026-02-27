=begin
Write your code for the 'Complex Numbers' exercise in this file. Make the tests in
`complex_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/complex-numbers` directory.
=end

class ComplexNumber
  attr_accessor :real, :imaginary

  EPSILON =1e-6

  def initialize(real, imaginary)
    self.real = real
    self.imaginary = imaginary
  end

  def *(other)
    self.class.new(
      self.real * other.real - self.imaginary * other.imaginary,
      self.imaginary * other.real + self.real * other.imaginary
    )
  end

  def /(other)
    self.class.new(
      (self.real * other.real + self.imaginary * other.imaginary).to_f/(other.real**2 + other.imaginary**2),
      (self.imaginary * other.real - self.real * other.imaginary).to_f/(other.real**2 + other.imaginary**2)
    )
  end

  def +(other)
    self.class.new(
      self.real + other.real,
      self.imaginary + other.imaginary
    )
  end

  def -(other)
    self.class.new(
      self.real - other.real,
      self.imaginary - other.imaginary
    )
  end

  def ==(other)
    (self.real - other.real) < EPSILON &&
    (self.imaginary - other.imaginary) < EPSILON
  end

  def abs
    Math.sqrt(self.real**2 + self.imaginary**2)
  end

  def conjugate
    self.class.new(self.real, - self.imaginary)
  end

  def exp
    self.class.new(
      Math.cos(self.imaginary) * Math::E ** self.real,
      Math.sin(self.imaginary) * Math::E ** self.real
    )
  end
end
