Warning[:experimental] = false

require 'etc'

class ParallelLetterFrequency
  NPROCS = Etc.nprocessors
  PARALLEL_THRESHOLD = 10_000

  def self.count(texts)
    return {} if texts.empty?

    if texts.sum(&:size) < PARALLEL_THRESHOLD
      tally_texts(texts)
    else
      parallel_tally(texts)
    end
  end

  def self.tally_text(text)
    text.gsub(/[^\p{Alpha}]/, '').downcase.chars.tally
  end

  def self.tally_texts(texts)
    merge_tallies(texts.map { |t| tally_text(t) })
  end

  def self.merge_tallies(tallies)
    tallies.each_with_object(Hash.new(0)) do |tally, freq|
      tally.each { |k, v| freq[k] += v }
    end
  end

  def self.partition(texts, n)
    chunks = Array.new([n, texts.size].min) { [] }
    texts.each_with_index { |t, i| chunks[i % chunks.size] << t }
    chunks
  end

  def self.parallel_tally(texts)
    ractors = partition(texts, NPROCS).map do |chunk|
      Ractor.new(chunk) { |txts| ParallelLetterFrequency.tally_texts(txts) }
    end

    results = []
    until ractors.empty?
      ractor, result = Ractor.select(*ractors)
      ractors.delete(ractor)
      results << result
    end
    merge_tallies(results)
  end
end
