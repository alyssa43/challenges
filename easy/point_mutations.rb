# Problem: create a problem that can calculate the hamming distance between two strands of DNA
  # rules:
    # The hamming distance is each time a chormosome is different than the cooresponding chromosome on the other strand
    # when strands are different sizes, calculate off the shorter strand

# Data structure:
  # given two strings that represents 2 DNA strands, return an integer

# Algorithm:
  # create a class called `DNA`
    # create a constructor method that takes one argument, a string
    # create an instance method called `hamming_distance` that accepts one argument, a string that represents another strand of DNA, and return an integer that represents the hamming distance of the two strands

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    short, long = [@strand.chars, other_strand.chars].sort_by(&:size)
    count = 0

    short.each_with_index do |char, index|
      count += 1 if char != long[index]
    end
    count
  end
end
