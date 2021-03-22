# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../strings_and_arrays'

class StringsAndArraysTest < Minitest::Test
  def test_is_string_uniqe
    # non-unique strings
    assert_equal false, StringsAndArrays.unique_string?('ddd')
    assert_equal false, StringsAndArrays.unique_string?('khaledd')
    assert_equal false, StringsAndArrays.unique_string?('12341')
    assert_equal false, StringsAndArrays.unique_string?('not unique')
    assert_equal false, StringsAndArrays.unique_string?('Uu')

    # wrong input
    assert_equal false, StringsAndArrays.unique_string?(113241)

    # unique strings
    assert_equal true, StringsAndArrays.unique_string?('123456789')
    assert_equal true, StringsAndArrays.unique_string?('khaled')
    assert_equal true, StringsAndArrays.unique_string?('ABCDEFGHIJKLMNOPQRSTU')
  end

  def test_arrays_are_permutations_to_each_other
    # correct
    assert_equal true, StringsAndArrays.permutations?([1], [1])
    assert_equal true, StringsAndArrays.permutations?([1, 2, 3], [3, 2, 1])
    assert_equal true, StringsAndArrays.permutations?([1, 2, 3, 3, 3], [3, 3, 3, 2, 1])

    # false
    assert_equal false, StringsAndArrays.permutations?([1], [3])
    assert_equal false, StringsAndArrays.permutations?([1], [1, 2])
    assert_equal false, StringsAndArrays.permutations?([1, 2, 2], [1, 2, 3])

    # wrong input
    assert_equal false, StringsAndArrays.permutations?([], [])
    assert_equal false, StringsAndArrays.permutations?([1], [])
    assert_equal false, StringsAndArrays.permutations?(1, [])
  end
end
