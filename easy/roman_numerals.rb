class RomanNumeral
  VALUES = { 
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    result = ''
    num = @number

    VALUES.each do |int, roman_num|
      while num >= int
        result << roman_num
        num -= int
      end
    end

    result
  end
end
