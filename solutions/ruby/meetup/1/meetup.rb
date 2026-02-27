=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end

require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(name, descriptior)
    range = Date.new(@year, @month, 1)..Date.new(@year, @month, -1)

    dates = range.select { |date| date.send("#{name}?") }

    case descriptior
    when :teenth
      dates.find { |date| date.mday.between?(13, 19) }
    when :first
      dates[0]
    when :second
      dates[1]
    when :third
      dates[2]
    when :fourth
      dates[3]
    when :last
      dates[-1]
    end
  end
end
