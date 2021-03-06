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

  def test_urlify
    # correct
    assert_equal 'kaheld%20job', StringsAndArrays.urlify('kaheld job   ', 10)
    assert_equal 'Mr%20John%20Smith', StringsAndArrays.urlify('Mr John Smith      ', 13)

    # incorrect
    assert_equal false, StringsAndArrays.urlify('Mr John Smith J       ', 15)

    # wrong input
    assert_equal false, StringsAndArrays.urlify(1, 1) # first param is not a string
    assert_equal false, StringsAndArrays.urlify('ddd', 0) # zero length
    assert_equal false, StringsAndArrays.urlify('khaled jobran  ', 13) # 2 spaces at the end instead of 3
  end

  def test_one_way
    assert_equal true, StringsAndArrays.one_way('pale', 'ple')
    assert_equal true, StringsAndArrays.one_way('pales', 'pale')
    assert_equal true, StringsAndArrays.one_way('pale', 'bale')
    assert_equal true, StringsAndArrays.one_way('aa', 'ab')
    assert_equal true, StringsAndArrays.one_way('aaa', 'aa')

    assert_equal false, StringsAndArrays.one_way('pale', 'bake')
    assert_equal false, StringsAndArrays.one_way('aaa', 'aaacc')
  end

  def test_string_compression
    assert_equal 'aabbcc', StringsAndArrays.string_compression('aabbcc') # result a2b2c2 is not shorter than input
    assert_equal 'a5', StringsAndArrays.string_compression('aaaaa')
    assert_equal 'a2b3c4', StringsAndArrays.string_compression('aabbbcccc')
  end

  def test_string_rotation
    assert_equal true, StringsAndArrays.string_rotation('waterbottle', 'erbottlewat')
    assert_equal true, StringsAndArrays.string_rotation('abcd', 'cdab')

    assert_equal false, StringsAndArrays.string_rotation('abc', 'bac')
  end
end
