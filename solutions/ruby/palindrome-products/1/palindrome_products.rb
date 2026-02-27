class Palindromes
  attr_accessor :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindromes = {}
  end

  def generate
    [*@min_factor..@max_factor]
      .repeated_permutation(2)
      .select { |first_factor, second_factor| first_factor <= second_factor }
      .each do |first_factor, second_factor|
        product = first_factor * second_factor
        if palindrome?(product)
          palindrome = @palindromes.fetch(product) { |v| Palindrome.new(v) }

          palindrome.factors << [first_factor, second_factor]

          @palindromes[product] = palindrome
        end
      end

    min, max = @palindromes.keys.minmax

    self.largest = @palindromes[max]
    self.smallest = @palindromes[min]
  end

  def palindrome?(number)
    number.digits.join.to_i == number
  end
end

class Palindrome
  attr_accessor :factors
  attr_reader :value

  def initialize(value)
    self.value = value
    self.factors = []
  end

  def equal?(other)
    self.value == other
  end

  private

  attr_writer :value
end
