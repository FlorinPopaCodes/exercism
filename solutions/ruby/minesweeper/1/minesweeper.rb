=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end
class Board
  def self.transform(inp)
    height = inp.size
    length = inp[0].length

    (0...(height)).each do |line_no|
      raise ArgumentError.new if inp[line_no].size != length
       
      (0...(length)).each do |row_no|
        raise ArgumentError.new unless ['+','-', '|', ' ', '*'].include?(inp[line_no][row_no])
        if inp[line_no][row_no] == ' '
          count = 0 
          count += 1 if inp[line_no - 1][row_no] == '*' # north
          count += 1 if inp[line_no + 1][row_no] == '*' # south
          count += 1 if inp[line_no][row_no + 1] == '*' # east
          count += 1 if inp[line_no][row_no - 1] == '*' # west
          count += 1 if inp[line_no - 1][row_no - 1] == '*' # NW
          count += 1 if inp[line_no - 1][row_no + 1] == '*' # NE
          count += 1 if inp[line_no + 1][row_no - 1] == '*' # SW
          count += 1 if inp[line_no + 1][row_no + 1] == '*' # SE

          inp[line_no][row_no] = count == 0 ? ' ' : count.to_s
        end
      end
     end

     inp
  rescue NoMethodError
    raise ArgumentError.new
  end
end