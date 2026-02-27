require "set"
require "pry"

class BookStore
  def self.calculate_price(basket)
    split_into_groups(basket).sum(&:price)
  end

  def self.group_finder(groups, book)
    groups << Group.new if groups.find { |s| !s.include?(book) }.nil?

    available_groups = groups
      .select { |s| !s.include?(book) }

    available_groups.sort.first
  end

  def self.split_into_groups(basket)
    groups = []

    basket.each do |book|
      group_finder(groups, book).add(book)
    end

    rebalance(groups)
  end

  def self.rebalance(groups)
    tplet = groups.find { |g| g.size == 3 }
    cplet = groups.find { |g| g.size == 5 }

    return groups unless cplet && tplet

    movable = (cplet ^ tplet).first
    tplet = tplet.add(movable)
    cplet = cplet.delete(movable)

    groups
  end

  class Group < Set
    UNIQUE_DISCOUNT = 0.05
    BOOK_PRICE = 8.00

    def volume_discount
      UNIQUE_DISCOUNT *
        case size
        when 2..3
          size-1
        when 4..5
          size
        else
          0
        end
    end

    def price
      BOOK_PRICE * size * (1 - volume_discount)
    end

    def inspect
      "#{super} #{price} #{volume_discount}"
    end

    def <=>(other)
      if size == 3 && other.size == 4
        -1
      elsif size == 4 && other.size == 3
        1
      else
        other.size<=>size
      end
    end
  end
end
