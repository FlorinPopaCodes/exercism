=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end
class TwelveDays
  CARDINAL = %w[a two three four five six seven eight nine ten eleven twelve]
  ORDINAL = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth]
  GIFTS = ['Partridge', 'Turtle Doves', 'French Hens', 'Calling Birds', 'Gold Rings', 'Geese-a-Laying', 'Swans-a-Swimming', 'Maids-a-Milking', 'Ladies Dancing', 'Lords-a-Leaping', 'Pipers Piping', 'Drummers Drumming']

  def self.song
    gifts = []
    12.times.map do |i|
      gifts.prepend "#{CARDINAL[i]} #{GIFTS[i]}"
      "On the #{ORDINAL[i]} day of Christmas my true love gave to me: #{join_gifts(gifts)} in a Pear Tree."
    end.join("\n\n") + "\n"
  end

  def self.join_gifts(gifts)
    [gifts[0..-2].join(', '), gifts[-1]].reject(&:empty?).join(', and ')
  end
end
