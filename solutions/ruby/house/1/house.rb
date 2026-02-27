# frozen_string_literal: true

class House
  def self.recite
    lines = []
    (1..12).each do |line_number|
      lines << verse(line_number)
    end
    lines.join("\n")
  end

  def self.verse(line_number)
    verse = 1.upto(line_number).map do |line_number|
      ["the #{line_number_to_words(line_number)}", line_number_to_phrase(line_number)]
    end.reverse.flatten.compact.each_slice(2).map do |words, phrase|
      [words, phrase].compact.join("\nthat ")
    end.join(' ')

    "This is #{verse} that Jack built.\n"
  end

  def self.line_number_to_words(line_number)
    case line_number
    when 1
      'house'
    when 2
      'malt'
    when 3
      'rat'
    when 4
      'cat'
    when 5
      'dog'
    when 6
      'cow with the crumpled horn'
    when 7
      'maiden all forlorn'
    when 8
      'man all tattered and torn'
    when 9
      'priest all shaven and shorn'
    when 10
      'rooster that crowed in the morn'
    when 11
      'farmer sowing his corn'
    when 12
      'horse and the hound and the horn'
    end
  end

  def self.line_number_to_phrase(line_number)
    case line_number
    when 2
      'lay in'
    when 3
      'ate'
    when 4
      'killed'
    when 5
      'worried'
    when 6
      'tossed'
    when 7
      'milked'
    when 8
      'kissed'
    when 9
      'married'
    when 10
      'woke'
    when 11
      'kept'
    when 12
      'belonged to'
    end
  end
end
