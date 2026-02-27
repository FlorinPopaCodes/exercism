=begin
Write your code for the 'Atbash Cipher' exercise in this file. Make the tests in
`atbash_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/atbash-cipher` directory.
=end

class Atbash
  ALPHABET = [*'a'..'z'].freeze
  NUMBERS = [*'0'..'9'].freeze

  MAP = ALPHABET.zip(ALPHABET.reverse).to_h.merge(NUMBERS.zip(NUMBERS).to_h).freeze

  def self.encode(plaintext)
    plaintext
      .scan(/[\w|\d]/)
      .map { |char| MAP[char.downcase] }
      .each_slice(5).map { |chars| chars.join }
      .join(' ')
  end

  def self.decode(ciphertext)
    ciphertext
      .scan(/[\w|\d]/)
      .map { |char| MAP[char] }
      .join
  end
end
