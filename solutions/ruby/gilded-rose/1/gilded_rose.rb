Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      conjured = item.name.start_with?("Conjured")
      base_name = conjured ? item.name.sub("Conjured ", "") : item.name

      if conjured && item.sell_in <= 0
        item.quality = 0
        item.sell_in -= 1
        next
      end

      case base_name.downcase
      when "backstage passes to a tafkal80etc concert"
        gain = 1
        gain += 1 if item.sell_in < 11
        gain += 1 if item.sell_in < 6
        gain -= 1 if conjured
        item.quality = [item.quality + gain, 50].min

        item.sell_in -= 1

        item.quality = item.quality - item.quality if item.sell_in < 0
      when "aged brie"
        item.quality += 1 if item.quality < 50
        item.sell_in -= 1

        if item.quality < 50 && item.sell_in < 0
          item.quality += 1
        end
      when "sulfuras, hand of ragnaros"
        if conjured
          item.sell_in -= 1
        end
      else
        if conjured
          item.quality -= 1 if item.quality > 0
        end

        item.quality -= 1 if item.quality > 0
        item.sell_in -= 1

        item.quality -= 1 if item.quality > 0 && item.sell_in < 0
      end
    end
  end
end
