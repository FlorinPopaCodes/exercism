=begin
Write your code for the 'Beer Song' exercise in this file. Make the tests in
`beer_song_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/beer-song` directory.
=end

class BeerSong
  def self.recite(bottles, times)
    # return if times <= 0
    return recite_zero if bottles <= 0

    result = <<~TEXT
    #{count_bottles(bottles)} of beer on the wall, #{count_bottles(bottles)} of beer.
    Take #{take(bottles)} down and pass it around, #{count_bottles(bottles - 1)} of beer on the wall.
    TEXT

    result += "\n" + recite(bottles - 1, times - 1) if times > 1

    result
  end

  def self.recite_zero
    <<~TEXT
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    TEXT
  end

  def self.take(number)
    number == 1 ? "it" : "one"
  end

  def self.count_bottles(number)
    if number > 1
      "#{number} bottles"
    elsif number == 1
      "#{number} bottle"
    else
      "no more bottles"
    end
  end
end
