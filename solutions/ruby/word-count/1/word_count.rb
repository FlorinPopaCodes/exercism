=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase
  def initialize(phase)
    @storage = Hash.new(0)

    phase
      .scan(/\b[\w']+\b/)
      .each do |word|
        @storage[word.downcase] += 1
      end
  end

  def word_count
    @storage
  end

end
