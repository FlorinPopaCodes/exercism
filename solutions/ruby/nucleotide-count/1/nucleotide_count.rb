class Nucleotide
  def self.from_dna(dna_string)
    histogram = { "A" => 0, "T" => 0, "C" => 0, "G" => 0 }

    dna_string.chars.each do |char|
      raise ArgumentError unless %w[A T C G].include?(char)

      histogram[char] += 1
    end

    self.new(histogram)
  end

  def initialize(histogram)
    @histogram = histogram
  end

  def count(letter)
    @histogram[letter]
  end

  def histogram
    @histogram
  end
end
