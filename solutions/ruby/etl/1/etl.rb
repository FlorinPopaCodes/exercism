=begin
Write your code for the 'ETL' exercise in this file. Make the tests in
`etl_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/etl` directory.
=end

class ETL
  def self.transform(old_array)
    result = {}

    old_array.each do |value, letters|
      letters.each do |letter|
        result[letter.downcase] = value
      end
    end

    result
  end
end
