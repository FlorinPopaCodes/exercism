=begin
Write your code for the 'Saddle Points' exercise in this file. Make the tests in
`saddle_points_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/saddle-points` directory.
=end
class Matrix
  def initialize(string_entry)
    @rows = string_entry
      .split("\n")
      .map { |row| row.split(' ').map(&:to_i) }

    @columns = @rows.transpose
  end

  def rows
    @rows
  end

  def columns
    @columns
  end

  def saddle_points
    results = []

    (0...@rows.size).each do |i|
      (0...@columns.size).each do |j|
        current = @rows[i][j]

        if current == @rows[i].max && current == @columns[j].min
          results << [i, j]
        end
      end
    end
    
    results
  end
end