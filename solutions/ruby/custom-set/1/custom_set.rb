class CustomSet
  def initialize(values)
    @set = Hash.new(false)

    values.each do |value|
      @set[value] = true
    end
  end
  
  def empty?
    @set.size == 0
  end

  def member?(element)
    @set[element]
  end

  def subset?(set)
    @set.all? { |value, _| set.member?(value) }
  end

  def disjoint?(set)
    @set.all? { |value, _| !set.member?(value) }
  end

  def ==(set)
    subset?(set) && set.subset?(self)
  end

  def add(value)
    @set.store(value, true)

    self
  end

  def intersection(set)
    self.class.new(@set.select { |value, _| set.member?(value) }.keys)
  end

  def difference(set)
    self.class.new(@set.select { |value, _| !set.member?(value) }.keys)
  end

  def values
    @set.keys
  end

  def union(set)
    self.class.new(values + set.values)
  end
end