# frozen_string_literal: true

# Creates a diamond made from a given Letter
class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    row = make_row(letter)

    rows = []
    range.each { |char| rows << row.gsub(/[^#{char}]/, ' ') }

    "#{rows.join("\n")}\n"
  end

  class << self
    private

    def make_row(letter)
      ascending = ('A'..letter).to_a
      descending = ascending[1..].reverse
      (descending + ascending).join
    end
  end
end
