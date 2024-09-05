# frozen_string_literal: true

# Scores a words scrabble value
class Scrabble
  VALUES = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }.freeze

  def initialize(word)
    @chars = word ? word.upcase.scan(/[A-Z]/) : []
  end

  def score
    @chars.map do |char|
      key = VALUES.keys.select { |k| k.include?(char) }.first

      VALUES[key]
    end.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
