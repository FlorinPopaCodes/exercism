class Proverb
  attr_accessor :items, :qualifier

  def initialize(*items, qualifier: nil)
    self.items = items
    self.qualifier = qualifier
  end

  def to_s
    output = ''

    (items.size - 1).times do |i|
      output += for_the_want_of(items[i], items[i+1])
    end

    output += all_for_the_want_of(items.first)

    output
  end

  def for_the_want_of(x, y)
    "For want of a #{x} the #{y} was lost.\n"
  end

  def all_for_the_want_of(z)
    if qualifier
      "And all for the want of a #{qualifier} #{z}."
    else
      "And all for the want of a #{z}."
    end
  end
end
