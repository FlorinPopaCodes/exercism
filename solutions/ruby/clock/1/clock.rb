=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    self.minute = minute % 60
    self.hour = (minute / 60 + hour) % 24
  end

  def to_s
    sprintf("%0.2d:%0.2d", hour, minute)
  end

  def +(clock)
    Clock.new(hour: hour + clock.hour, minute: minute + clock.minute)
  end

  def -(clock)
    Clock.new(hour: hour - clock.hour, minute: minute - clock.minute)
  end

  def ==(clock)
    hour == clock.hour && minute == clock.minute
  end

  private

  attr_writer :hour, :minute
end
