class Crypto
  def initialize(input)
    @output = input
  end

  def ciphertext
    clean
    square

    @output
  end

  def clean
    @output = @output
      .downcase
      .tr('^a-z0-9', '')
  end

  def square
    sqrt = Math.sqrt(@output.size)
    cols = sqrt.ceil
    rows = sqrt.round

    return unless cols > 1

    pointer = 0
    result = []

    (0...rows).each do |_|
      (0...cols).each do |col_no|
        char = @output[pointer] || ' '
        pointer += 1

        result[col_no] = (result[col_no] || '') + char
      end
    end

    @output = result.join(' ')
  end
end
