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

    def permutations?(arr1, arr2)
      return false unless arr1.is_a?(Array) && arr2.is_a?(Array)
      return false unless arr1.length == arr2.length
      return false if arr1.length == 0

      map = {}
      arr1.each do |el|
        map[el].nil? ? map[el] = 1 : map[el] += 1
      end

      arr2.each do |el|
        return false if map[el].nil? || map[el].zero?
        map[el] -= 1
      end
      true
    end
  end
end
