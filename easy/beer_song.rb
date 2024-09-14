# frozen_string_literal: true

# Sings the Beer song
class BeerSong
  def self.verse(num)
    case num
    when 0 then no_bottles
    when 1 then one_bottle
    when 2 then two_bottles
    else three_or_more_bottles(num)
    end
  end

  def self.verses(num1, num2)
    result = ''

    num1.downto(num2) { |num| result += "#{verse(num)}\n" }

    result.chomp
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def no_bottles
      <<~LYRICS
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      LYRICS
    end

    def one_bottle
      <<~LYRICS
        1 bottle of beer on the wall, 1 bottle of beer.
        Take it down and pass it around, no more bottles of beer on the wall.
      LYRICS
    end

    def two_bottles
      <<~LYRICS
        2 bottles of beer on the wall, 2 bottles of beer.
        Take one down and pass it around, 1 bottle of beer on the wall.
      LYRICS
    end

    def three_or_more_bottles(num)
      <<~LYRICS
        #{num} bottles of beer on the wall, #{num} bottles of beer.
        Take one down and pass it around, #{num - 1} bottles of beer on the wall.
      LYRICS
    end
  end
end
