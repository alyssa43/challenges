# frozen_string_literal: true

# Used to return the sum of multiples of a given number
class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def to(num)
    multiples(num).sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  private

  def multiples(num)
    (1...num).select do |n|
      @set.any? { |i| (n % i).zero? }
    end
  end
end
