class BinarySearch
  def initialize(array_to_search)
    @array_to_search = array_to_search
  end

  def search_for(item)
    recursive_search_for(item, 0, @array_to_search.size)
  end

  def recursive_search_for(item, start_search, end_search)
    middle = (end_search + start_search)/2

    return nil if start_search == end_search && @array_to_search[middle] != item

    if @array_to_search[middle] > item
      recursive_search_for(item, start_search, middle)
    elsif @array_to_search[middle] < item
      recursive_search_for(item, middle + 1, end_search)
    else
      middle
    end
  end
end
