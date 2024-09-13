# frozen_string_literal: true

# Converts an Octal to a decimal
class Octal
  def initialize(str_num)
    @num = invalid?(str_num) ? 0 : str_num.to_i
  end

  def to_decimal
    @num.digits.map.with_index do |num, index|
      num * 8**index
    end.sum
  end

  private

  def invalid?(str_num)
    str_num.match(/[^0-7]/)
  end
end
