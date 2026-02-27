=begin
Write your code for the 'Linked List' exercise in this file. Make the tests in
`linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/linked-list` directory.
=end

class Deque
    def initialize
        @head = nil
        @tail = nil
    end

    def unshift(value)
        node = Node.new(value)

        @tail = node unless @tail
        if @head
            @head.prev = node
            node.next = @head
        end
        @head = node
    end

    def push(value)
        node = Node.new(value)

        @head = node unless @head
        if @tail
            @tail.next = node
            node.prev = @tail 
        end
        @tail = node
    end

    def pop
        result = @tail
        @tail = result.prev
        @head = nil unless @tail
        result.prev = nil
        
        result.value
    end

    def shift
        result = @head
        @head = result.next
        @tail = nil unless @head
        result.next = nil

        result.value
    end
end

class Node
    attr_accessor :next, :prev, :value

    def initialize(value)
        self.value = value
    end
end