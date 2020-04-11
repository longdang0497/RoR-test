def isPalindrome(str)
  left = 0
  right = str.length - 1

  while (left <= right) 
    if !str[left].eql?(str[right])
      return false
    end 
    left += 1
    right -= 1
  end 
end 

str = "racecar"
isPalindrome(str).eql?(false) ? (puts "It's not a palindrome") : (puts "It's a palindrome")