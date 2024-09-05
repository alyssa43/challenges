# Problem: write a program that takes a single word and a list of words, and returns the words from the list that are anagrams of the single word
# rules:
# case insensitive
# identical words are NOT anagrams

# Example:
# 'ant', ['ant, 'at', 'stand', 'tan'] => 'tan'

# Data Structure:
# beginning: string and array of strings
# ending: string

# Algorithm:
# Create a class called `Anagram`
# Create a constructor method that accepts one argument, a string, and assign to an instance variable called `@word` (downcase)
# Create an instance method called `match` that accepts one argument, an array of word(s).
# select and return the words that are anagrams of `@word`

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select { |current_word| anagram?(current_word) }
  end

  private

  def sort_word(word)
    word.downcase.chars.sort.join
  end

  def anagram?(word2)
    sort_word(@word) == sort_word(word2) && @word != word2.downcase
  end
end
