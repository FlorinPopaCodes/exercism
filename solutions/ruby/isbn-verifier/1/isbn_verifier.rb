=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end

class IsbnVerifier
  def self.valid?(string)
    clean_string = string.gsub('-', '')[/^(\d{9}X|\d{10})$/]

    return false if clean_string.nil?

    sum = 0

    clean_string
      .chars
      .each_with_index do |i, index|
        number = i == 'X' ? 10 : i.to_i
        sum += number * (10 - index)
      end

    sum % 11 == 0
  end
end
