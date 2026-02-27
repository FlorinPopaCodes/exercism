=begin
Write your code for the 'Phone Number' exercise in this file. Make the tests in
`phone_number_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/phone-number` directory.
=end

class PhoneNumber
  def self.clean(string)
    number = string.tr('^0123456789', '')

    return unless [10, 11].include?(number.size)
    return if number.size == 11 && !number.start_with?('1')

    no_prefix_number = number[-10, 10]

    return unless no_prefix_number.match?(/[2-9][0-9]{2}[2-9][0-9]{6}/)

    no_prefix_number
  end
end
