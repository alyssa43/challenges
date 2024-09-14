# frozen_string_literal: true

# Slices a string number into a series of digits
class Series
  def initialize(str_num)
    @digits = str_num.chars.map(&:to_i)
  end

  def slices(int)
    raise ArgumentError if int > @digits.size

    @digits.each_cons(int).to_a
  end
end
