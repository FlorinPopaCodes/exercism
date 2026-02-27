class Transpose
  def self.transpose(input)
    input = parse(input)
    input = pad_left_with_spaces(input)
    input = equalize_lines(input)
    input = input.transpose

    output(input)
  end

  def self.parse(input)
    input.split("\n").map { |line| line.split('') }
  end

  def self.pad_left_with_spaces(input)
    input
      .chunk_while { |line1, line2| line1.size < line2.size }
      .map do |lines|
        max_size = lines.map(&:size).max

        lines.map do |line|
          line + [' '] * (max_size - line.size)
        end
      end.to_a.flatten(1)
  end

  def self.equalize_lines(input)
    max_line_length = input.map(&:size).max

    input.map do |line|
      line + [''] * (max_line_length - line.size)
    end
  end

  def self.output(input)
    input.map(&:join).join("\n")
  end
end
