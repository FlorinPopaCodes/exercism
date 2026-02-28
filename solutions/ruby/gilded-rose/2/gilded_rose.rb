Item = Struct.new(:name, :sell_in, :quality)

class BaseUpdater
  def self.update(item, conjured: false)
    update_sell_in(item, conjured:)
    update_quality(item, conjured:)
  end

  def self.update_sell_in(item, conjured:)
    item.sell_in -= 1
  end

  def self.update_quality(item, conjured:) = nil
end

class SulfurasUpdater < BaseUpdater
  def self.update_sell_in(item, conjured:)
    item.sell_in -= 1 if conjured
  end
end

class NormalUpdater < BaseUpdater
  def self.update_quality(item, conjured:)
    return unless item.quality > 0

    item.quality -= 1 if conjured
    item.quality -= 1 if item.quality > 0
    item.quality -= 1 if item.quality > 0 && item.sell_in < 0
  end
end

class AgedBrieUpdater < BaseUpdater
  def self.update_quality(item, conjured:)
    item.quality += 1 if item.quality < 50
    item.quality += 1 if item.quality < 50 && item.sell_in < 0
  end
end

class BackstagePassUpdater < BaseUpdater
  def self.update(item, conjured: false)
    update_quality(item, conjured:)
    update_sell_in(item, conjured:)
    item.quality = 0 if item.sell_in < 0
  end

  def self.update_quality(item, conjured:)
    gain = 1
    gain += 1 if item.sell_in < 11
    gain += 1 if item.sell_in < 6
    gain -= 1 if conjured
    item.quality = [item.quality + gain, 50].min
  end
end

class ConjuredUpdater
  def initialize(base)
    @base = base
  end

  def update(item)
    if item.sell_in <= 0
      item.quality = 0
      item.sell_in -= 1
    else
      @base.update(item, conjured: true)
    end
  end
end

class GildedRose
  UPDATERS = {
    "Aged Brie" => AgedBrieUpdater,
    "Sulfuras" => SulfurasUpdater,
    "TAFKAL80ETC" => BackstagePassUpdater
  }

  def initialize(items)
    @items = items
  end

  def update!
    @items.each { |item| updater_for(item.name).update(item) }
  end

  private

  def updater_for(name)
    conjured = name.start_with?("Conjured")
    _, base = UPDATERS.detect { |key, _| name.include?(key) }
    base ||= NormalUpdater
    conjured ? ConjuredUpdater.new(base) : base
  end
end
