class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def initialize
    @list = [head]
  end

  def size
    @list.compact.size
  end

  def empty?
    size == 0
  end

  def push(datum)
    next_element = Element.new(datum, head)
    @list.unshift(next_element)
    self.head = next_element
  end

  def peek
    head.nil? ? head : head.datum
  end

  def pop
    removed = @list.delete_at(0).datum
    self.head = @list.first
    removed
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse.each { |element| list.push(element) }
    list
  end

  def to_a
    @list.compact.map(&:datum)
  end

  def reverse
    reversed = SimpleLinkedList.new
    @list.compact.each { |element| reversed.push(element.datum) }
    reversed
  end
end
