=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end

class IsbnVerifier
  def self.valid?(string)
    clean_string = string.gsub(/[^0-9X]/, '')[/^(\d{9}X|\d{10})$/]

    return false if clean_string.nil?

    sum = 0

    clean_string[0, 9]
      .chars
      .map(&:to_i)
      .each_with_index do |i, index|
        sum += i * (10 - index)
      end

    sum += clean_string[-1] == 'X' ? 10 : clean_string[-1].to_i

    sum % 11 == 0
  end
end
