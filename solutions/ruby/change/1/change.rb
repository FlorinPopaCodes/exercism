class Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  # Take an array of coin denominations and a target amount of change.
  def self.generate(coins, change)
    return [] if change.zero?
    raise NegativeTargetError if change.negative?

    1.upto(15).each do |i|
      coins.repeated_combination(i) do |combination|
        return combination if combination.sum == change
      end
    end

    raise ImpossibleCombinationError
  end
end
