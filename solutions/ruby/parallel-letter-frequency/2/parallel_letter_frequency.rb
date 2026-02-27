class ParallelLetterFrequency
  def self.count(texts)
    ractors = []
    texts.each do |text|
      ractors << Ractor.new(text) do |current_text|
        current_text.downcase.each_grapheme_cluster.select do |cluster|
          cluster.match?(/\p{Alpha}/)
        end.tally
      end
    end

    results = Hash.new(0)

    until ractors.empty?
      ractor, result = Ractor.select(*ractors)
      ractors.delete ractor
      result.each { |k, v| results[k] += v }
    end

    results
  end
end
