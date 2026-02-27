require 'byebug'

class RailFenceCipher
  def self.encode(message, levels)
    rails = Array.new(levels) { [] }

    position = Position.new(levels)

    message.each_char do |c|
      rails[position.current] << c

      position.increment
    end

    rails.map(&:join).join
  end


  def self.decode(message, levels)
    response = ''
    counts = []
    rails = []
    position = Position.new(levels)

    message.size.times do 
      counts << position.current
      position.increment
    end

    counts = counts.group_by(&:itself).map { |_,v| v.size }

    message_array = message.each_char.to_a

    counts.each do |count|
      rails << message_array.shift(count)
    end

    position = Position.new(levels)

    message.size.times do
      response += rails[position.current].shift

      position.increment
    end

    response
  end

  class Position
    def initialize(max)
      @position = 0
      @direction = 1
      @min = 0
      @max = max - 1
    end

    def current
      @position
    end

    def increment
      return if @min == @max

      if @position == @max
        @direction = -1
      elsif @position == @min
        @direction = 1
      end
      
      @position += @direction
    end
  end
end