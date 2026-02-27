=begin
Write your code for the 'Roman Numerals' exercise in this file. Make the tests in
`roman_numerals_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/roman-numerals` directory.
=end

class Integer
  def to_roman
    n = self

    case n
    when (1000..)
      'M' * (n / 1000) + (n - n / 1000 * 1000).to_roman
    when 900..999
      'CM' + (n - 900).to_roman
    when 500..899
      'D' + (n - 500).to_roman
    when 400..499
      'CD' + (n - 400).to_roman
    when 100..399
      'C' * (n / 100) + (n - n / 100 * 100).to_roman
    when 90..99
      'XC' + (n - 90).to_roman
    when 50..89
      'L' + (n - 50).to_roman
    when 40..49
      'XL' + (n - 40).to_roman
    when 10..39
      'X' * (n / 10) + (n - n / 10 * 10).to_roman
    when 9
      'I' + 'X'
    when 5..8
      'V' + (n - 5).to_roman
    when 4
      'IV'
    when 1..3
      'I' * n
    else
      ''
    end
  end
end
