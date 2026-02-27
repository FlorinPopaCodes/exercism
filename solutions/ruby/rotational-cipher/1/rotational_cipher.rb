class RotationalCipher
  def self.rotate(string, amount)
    string
      .codepoints
      .map { |value|
        if value.chr.match(/[a-zA-Z]/)
          diff = value.chr.match(/[A-Z]/) ? 'A'.ord : 'a'.ord

          (value - diff + amount) % 26 + diff
        else
          value
        end
      }.map(&:chr).join
  end

end
