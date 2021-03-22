# frozen_string_literal: true

class StringsAndArrays
  class << self
    def unique_string?(str)
      return false unless str.is_a? String

      map = {}
      str.each_char do |char|
        return false if map[char] == 1
        map[char.downcase] = 1
      end
      true
    end
  end
end
