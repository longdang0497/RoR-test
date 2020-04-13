require "test/unit"
require_relative './palindrome'

class PalindromeTest < Test::Unit::TestCase
  def test_palindrome
    assert_equal false, Palindrome.isPalindrome("race")
    assert_equal true, Palindrome.isPalindrome("racecar")
  end
end