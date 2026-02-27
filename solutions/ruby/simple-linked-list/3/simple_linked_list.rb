=begin
Write your code for the 'Simple Linked List' exercise in this file. Make the tests in
`simple_linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/simple-linked-list` directory.
=end

class Element
  attr_accessor :next
  attr_reader :datum

  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def initialize(arr = [])
    @root = nil

    arr.each do |val|
      push(Element.new(val))
    end
  end

  def push(element)
    element.next = @root if @root
    @root = element

    self
  end

  def pop
    pointer = @root
    @root = @root.next if @root

    return pointer
  end

  def to_a
    result = []

    current = @root
    while current do
      result << current.datum
      current = current.next
    end

    result
  end

  def reverse!
    pointer, previous = @root, nil
    while(pointer) do
       previous, previous.next, pointer = pointer, previous, pointer.next
    end
    @root = previous

    self
  end
end
