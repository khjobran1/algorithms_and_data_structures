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

    def urlify(url, length)
      return false unless url.is_a?(String) && length.is_a?(Integer)
      return false unless length.positive?
      return false unless length < url.length

      return false unless (url.length - length) % 3 == 0
      num_of_spaces = (url.length - length) / 3

      result = ''
      url.each_char.with_index do |char, i|
        break if num_of_spaces.zero? && char == ' '
        if char == ' '
          num_of_spaces -= 1
          result << '%20'
          next
        end
        result << char
      end
      result
    end

    def one_way(str1, str2)
      return false unless str1.is_a?(String) && str1.is_a?(String)
      diff = str1.length - str2.length
      return false unless diff == 0 || 1 || -1

      str1.downcase
      str2.downcase

      map = {}
      str1.each_char do |char|
        if map[char].nil?
          map[char] = 1
          next
        end
        map[char] += 1
      end

      str2.each_char do |char|
        if map[char].nil?
          map[char] = 1
          next
        end
        map[char] -= 1
      end

      return map.values.sum == 2 if diff == 0
      map.values.sum == 1 || map.values.sum == -1
    end

    def string_compression(str)
      return false unless str.is_a?(String)

      map = {}
      sorted_uniq_chars = []
      str.each_char do |char|
        if map[char].nil?
          sorted_uniq_chars << char
          map[char] = 1
          next
        end
        map[char] += 1
      end

      result = ''
      sorted_uniq_chars.each do |char|
        result << "#{char}#{map[char]}"
      end
      return result if result.length < str.length
      str
    end

    def string_rotation(str, rotation_str)
      substr = ''
      remaining_count = 0
      before_first_letter = true
      rotation_str.each_char do |char|
        if before_first_letter
          if char == str[0]
            before_first_letter = false
            return false unless str.include?(substr)
          end
          substr << char
        else
          remaining_count += 1
          return false unless char == str[remaining_count]
        end
      end
      true
    end
  end
end
