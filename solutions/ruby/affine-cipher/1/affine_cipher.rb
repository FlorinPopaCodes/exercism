class Affine
  ALPHABET = [*'a'..'z'].freeze
  NUMBERS = [*'0'..'9'].freeze

  def initialize(a, b)
    raise ArgumentError unless ALPHABET.size.gcd(a) == 1

    map = NUMBERS.zip(NUMBERS).to_h

    ALPHABET.each_with_index do |letter, index|
      map[letter] = (97 + (a * index + b) % ALPHABET.size).chr
    end

    @map = map
  end

  def encode(plaintext)
    plaintext
      .scan(/[\w|\d]/)
      .map { |char| @map[char.downcase] }
      .each_slice(5).map { |chars| chars.join }
      .join(' ')
  end

  def decode(ciphertext)
    ciphertext
      .scan(/[\w|\d]/)
      .map { |char| @map.select { |_,v| v == char }.keys.first  }
      .join
  end
end
