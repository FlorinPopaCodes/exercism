=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix

  def initialize(string_representation)
    @data = string_representation
      .split("\n")
      .map { |row| row.split(' ').map(&:to_i) }
  end

  def rows
    @data
  end

  def columns
    @data.transpose
  end
end
