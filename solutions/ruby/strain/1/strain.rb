=begin
Write your code for the 'Strain' exercise in this file. Make the tests in
`strain_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/strain` directory.
=end

module Enumerable
  def keep(&block)
    results = []

    self.each do |i|
      results << i if yield(i)
    end

    results
  end

  def discard(&block)
    results = []

    self.each do |i|
      results << i if !yield(i)
    end

    results
  end
end
