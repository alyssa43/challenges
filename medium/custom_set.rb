class CustomSet
  def initialize(set=[])
    @set = set.uniq.sort
  end

  def empty?
    set.empty?
  end

  def contains?(integer)
    set.include?(integer)
  end

  def subset?(other)
    set.all? { |num| other.contains?(num) }
  end

  def disjoint?(other)
    set.none? { |num| other.contains?(num) }
  end

  def eql?(other)
    set == other.set
  end

  def add(number)
    set << number
    CustomSet.new(set)
  end

  def intersection(other)
    new_set = (set + other.set).uniq.select do |num|
      contains?(num) && other.contains?(num)
    end
    CustomSet.new(new_set)
  end

  def difference(other)
    CustomSet.new(set - other.set)
  end

  def union(other)
    CustomSet.new(set + other.set)
  end

  def ==(other)
    set == other.set
  end

  protected

  attr_reader :set
end
