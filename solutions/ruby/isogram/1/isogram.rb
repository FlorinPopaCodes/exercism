=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram
  def self.isogram?(input)
    result = true
    visited = Hash.new(false)

    input.each_char do |chr|
      next if [' ', '-'].include?(chr)
      
      if visited[chr.downcase]
        result = false
        break
      else
        visited[chr.downcase] = true
      end
    end

    result
  end
end
