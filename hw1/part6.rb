=begin
  Part A — Currency conversion (ELLS 3.11): Extend the currency-conversion example
  from lecture so that code such as the following will work:

    5.dollars.in(:euros)
    10.euros.in(:rupees)

  You should support the currencies dollars, euros, rupees, yen where the conversions are:

    rupees to dollars, multiply by 0.019,
    yen to dollars, multiply by 0.013,
    euro to dollars, multiply by 1.292.

  Both the singular and plural forms of each currency should be acceptable,
  e.g. 1.dollar.in(:rupees) and 10.rupees.in(:euro) should work. 
=end

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end
  end
end

=begin
# Part A - Application Test/Demo
  p 100.rupees
  p 100.euros
  p 100.dollars.in(:rupees)
  p 1.dollar.in(:rupees)
  p 1.dollar.in(:rupees).in(:dollar)    # wrong!
=end

################################################################################

=begin
  Part B — Palindromes: Adapt your solution from the "palindromes" question so that
  instead of writing palindrome?("foo") you can write "foo".palindrome?
  (Hint: this should require fewer than 5 lines of code.)  
=end
class String
  def palindrome?
    packed_str = self.downcase.gsub(/\W/, '')
    return (packed_str == packed_str.reverse)
  end
end

=begin
# Part B - Application Test/Demo
p  "A man, a plan, a canal -- Panama".palindrome?  # => true
p  "Madam, I'm Adam!".palindrome?                  # => true
p  "Abracadabra".palindrome?                       # => false (nil is also ok) 
=end

################################################################################

=begin
  Part C — Palindromes again: Adapt your palindrome solution so that it works on Enumerables. That is:
  [1,2,3,2,1].palindrome? # => true

  It's not necessary for the collection's elements to be palindromes themselves --only that the
  top-level collection be a palindrome. (Hint: this should require fewer than 5 lines of code.)
  Although hashes are considered Enumerables, your solution does not need to work with hashes,
  though it should not error. 
=end

# NOTE: Follow is NOT an adaptation of original palindrome solution.
# This one uses a loop, doesn't ignore case during comparison.
# Also, converts the enumerable to an array.
# Even though the autograder has accepted this solution, not sure whether this is the right way to solve it.
module Enumerable
  def palindrome?
    arr = self.to_a
    for i in 0 .. (arr.length/2) do
      return false unless arr[i] == arr[-1-i] 
    end
    return true
  end
end

=begin
# Part C - Application Test/Demo
p  [1,2,3,2,1].palindrome? # => true
p  [1,:somekey,3,:somekey,1].palindrome? # => true
#p  { 1=>2, 3=>2, 1=>1, 3=>2, 1=>2}.palindrome? # => true
rx = { 1=>2, 3=>2, 1=>1, 3=>2, 1=>2}
p rx.palindrome?
=end
