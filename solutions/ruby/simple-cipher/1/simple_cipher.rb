# frozen_string_literal: true

# Write your code for the 'Simple Cipher' exercise in this file. Make the tests in
# `simple_cipher_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/simple-cipher` directory.

class Cipher
  attr_accessor :key

  def initialize(key = 'aaaaaaaaaa')
    raise ArgumentError unless key.match?(/[a-z]/)

    self.key = key
  end

  def offset(index)
    key_chars = key.chars
    key_chars[index % key_chars.size].ord - 'a'.ord
  end

  def bound(value)
    v = value
    v = value - 26 if value > 'z'.ord
    v = value + 25 if value < 'a'.ord
    v
  end

  def encode(plaintext)
    result = ''

    plaintext
      .chars
      .each_with_index do |c, i|
        result += bound(c.ord + offset(i)).chr
      end

    result
  end

  def decode(encryptedtext)
    result = ''

    encryptedtext
      .chars
      .each_with_index do |c, i|
        result += (c.ord - offset(i)).chr
      end

    result
  end
end
