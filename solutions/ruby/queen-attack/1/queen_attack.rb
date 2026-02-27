=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end

class Queens

  def initialize(white:, black: [])
    raise ArgumentError unless white.all? { |coordonate| coordonate.between?(0, 7) }
    raise ArgumentError unless black.all? { |coordonate| coordonate.between?(0, 7) }

    @white = white
    @black = black
  end

  def attack?
    slope = (@white[1] - @black[1]).to_f / (@white[0] - @black[0])

    [0, -1, 1, Float::INFINITY, -Float::INFINITY].include?(slope)
  end
end
