=begin
Write your code for the 'Alphametics' exercise in this file. Make the tests in
`alphametics_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/alphametics` directory.
=end

class Alphametics
  def self.solve(puzzle)
    letters = puzzle.scan(/\w/).uniq
    leading_letters = puzzle.scan(/\w+/).map { |w| w[0] }.uniq
    
    result = [*1..9, 0]
      .permutation(letters.size)
      .reject { |perm|
        letters.zip(perm).any? { |l,v| leading_letters.include?(l) && v == 0 }
      }.find { |perm|
        eval(puzzle.tr(letters.join, perm.join))
      }

    result ? letters.zip(result).to_h : {}
  end
end
