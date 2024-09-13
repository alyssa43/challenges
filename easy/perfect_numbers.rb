# Problem: Write a program that takes an Integer, and returns a String that identifies if the input Integer is either a:
  # Perfect number -> aliquot sum == input integer
  # Abundant number -> aliquot sum > input integer
  # Deficient number -> aliquot sum < original integer

  # rules:
    # Aliquot sum is sum of all of the positive divisors of the current integer

# Example:
# 6 -> perfect number
# positive divisors of 6:
  # 1, 2, 3 -> 1+2+3 => 6

# 7 -> deficient number
# positive divisors of 7:
  # 1 => 1

# Data Structure:
  # beginning: Integer
  # intermediate: Array of divisors
  # ending: String

# Algoirthm:
  # Create a class called `PerfectNumber`
    # Create a class method called `classify` that accepts one argument, an Integer
      # The class method `classify` should return one of the following strings:
        # 'deficient', 'perfect', or `adundant`
      # If the input integer is less than 1, return a StandardError

# My Initiali Solution:
class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    aliquot_sum = self.divisors(number).sum

    if aliquot_sum == number
      'perfect'
    elsif aliquot_sum > number
      'abundant'
    else
      'deficient'
    end
  end

  def self.divisors(num)
    (1...num).to_a.select { |n| num % n == 0 }
  end
end

# LS Solution:
class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    aliquot_sum = divisors(number).sum

    if aliquot_sum == number
      'perfect'
    elsif aliquot_sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def divisors(num)
      (1...num).to_a.select { |n| num % n == 0 }
    end
  end
end

# class << self 
# ^ this idiom lets us operate on the class itself as an object; by adding a private instance method to the class object, we effectively create a private class method.