=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end
class Bst
  attr_accessor :data, :left, :right

  def initialize(value)
    self.data = value
  end

  def insert(value)
    current = self

    loop do
      if value > current.data
        if current.right
          current = current.right
        else
          current.right = Bst.new(value)
          break
        end
      else
        if current.left
          current = current.left
        else
          current.left = Bst.new(value)
          break
        end
      end
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    self.left.each(&block) if self.left
    block.call(self.data)
    self.right.each(&block) if self.right
  end
end
