=begin
Write your code for the 'Phone Number' exercise in this file. Make the tests in
`phone_number_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/phone-number` directory.
=end

class PhoneNumber
  VALID_NUMBER = /^[2-9]\d{2}[2-9]\d{6}$/

  def self.clean(string)
    string.gsub(/\D/, '').sub(/^1/, '')[VALID_NUMBER]
  end
end
