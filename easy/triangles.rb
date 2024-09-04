# Problem: write a program to determine whether a triangle is:
  # Rules:
  # Equalateral => 3 sides of same length
  # Isosceles => 2 sides same length
  # Scalene => sides all different lengths
  # For a shape to be a triangle, there must be:
    # 3 sides
    # all sides must have a length > 0
    # the sum of two sides lengths must be greater than the length of the third side

  # Example:
    # sides = 2, 2, 2
    # 3 sides? => true
    # all sides length > 0 ? => true
    # 2 + 2 > 2 ? => true
    # all sides same length => equilateral
  
  # Algorithm:
    # create a class called `Triangle`
      # the class needs an `initialize` method that accepts three arguments(side1, side2, side3)
      # the class needs an instance method called `kind` that returns a string referencing the type of triangle it is

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]

    raise ArgumentError.new('Invalid length') unless valid_triangle?
  end

  def kind
    case @sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  def valid_triangle?
    @sides.all? { |side| side > 0 } &&
    @side1 + @side2 > @side3 &&
    @side2 + @side3 > @side1 &&
    @side1 + @side3 > @side2
  end
end

