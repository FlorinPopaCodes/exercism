class WordProblem
  TOKEN_REGEX = /-?\d+|plus|minus|multiplied|divided/.freeze

  def initialize(input)
    @tokens = input.scan(TOKEN_REGEX)
  end

  def answer
    raise ArgumentError if @tokens.size < 3

    result = @tokens[0].to_i

    (@tokens.size / 2).times do |group_index|
      case @tokens[group_index * 2 + 1]
      when 'plus'
        result += @tokens[group_index * 2 + 2].to_i
      when 'minus'
        result -= @tokens[group_index * 2 + 2].to_i
      when 'multiplied'
        result *= @tokens[group_index * 2 + 2].to_i
      when 'divided'
        result /= @tokens[group_index * 2 + 2].to_i
      end
    end

    result
  end
end
