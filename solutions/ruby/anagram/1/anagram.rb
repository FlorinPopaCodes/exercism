=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
  def initialize(target)
    @target = target.downcase
    @sorted_target = target.chars.map(&:downcase).sort.join
  end

  def match(arr)
    arr.select { |i| anagram?(i) }
  end

  private

  def anagram?(str)
    @target != str.downcase &&
      @sorted_target == str.chars.map(&:downcase).sort.join
  end
end
