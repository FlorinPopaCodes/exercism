class Queens
  def initialize(white:, black: [])
    raise ArgumentError unless white.all? { |coordonate| coordonate.between?(0, 7) }

    @white = white
    @black = black
  end

  def attack?
    slope = (@white[1] - @black[1]).to_f / (@white[0] - @black[0])

    [0, -1, 1, Float::INFINITY, -Float::INFINITY].include?(slope)
  end
end
