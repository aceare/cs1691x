=begin
  (a) Palindrome detection

  Write a method palindrome?(string) that determines whether a given string
  (word or phrase) is a palindrome, that is, it reads the same backwards as
  forwards, ignoring case, punctuation, and nonword characters.
  (A "nonword character" is defined for our purposes as "a character that
  Ruby regexps would treat as a nonword character".)

  The structure of your code should look as follows:

  def palindrome?(string)
    # your code here
  end

  Your solution shouldn't use loops or iteration of any kind. Instead, you will
  find regular-expression syntax very useful; it's reviewed briefly in the book,
  and the website rubular.com lets you try out Ruby regular expressions "live".
  Some methods that you might find useful (which you'll have to look up in Ruby
  documentation, ruby-doc.org) include: String#downcase, String#gsub, String#reverse.

  Example test cases:

  palindrome?("A man, a plan, a canal -- Panama")  # => true
  palindrome?("Madam, I'm Adam!")                  # => true
  palindrome?("Abracadabra")                       # => false (nil is also ok) 
  
=end

# compares half strings, but is the complexity worth the gains???
def palindrome_v1?(str)
  packed_str = str.downcase.gsub(/\W/, '')
  # a, aba, abba, aa, aaa
  target_match_offset = packed_str.length / 2
  target_string_pattern = "^#{packed_str.slice(target_match_offset..-1).reverse}"
  return true if packed_str.match(target_string_pattern)
end

def palindrome?(str)
  packed_str = str.downcase.gsub(/\W/, '')
  return (packed_str == packed_str.reverse)
end


#p  palindrome?("A man, a plan, a canal -- Panama")  # => true
#p  palindrome?("Madam, I'm Adam!")                  # => true
#p  palindrome?("Abracadabra")                       # => false (nil is also ok) 
#p  palindrome?("A")                                 # => true 
#p  palindrome?("Aa")                                # => true 
#p  palindrome?("AAa")                               # => true 
#p  palindrome?("AAaA")                              # => true 


###############################################################################

=begin
  (b) Word count

  Define a function count_words(string) that, given an input string,
  return a hash whose keys are words in the string and whose values
  are the number of times each word appears. Your code should look like:

  def count_words(string)
    # your code here
  end

  Your solution shouldn't use for-loops, but iterators like each are permitted.
  As before, nonwords and case should be ignored. A word is defined as a string
  of characters between word boundaries. (Hint: the sequence \b in a Ruby regexp
  means "word boundary".)

  Example test cases:

  count_words("A man, a plan, a canal -- Panama")
    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
  count_words "Doo bee doo bee doo"
    # => {'doo' => 3, 'bee' => 2}
 
=end

def count_words(str)
  result = Hash.new(0)
  str.downcase.split(%r{\W+}).each { |key| result[key] = result[key] + 1 }
  return result
end

#p count_words("A man, a plan, a canal -- Panama")
    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
#p count_words "Doo bee doo bee doo"
    # => {'doo' => 3, 'bee' => 2}
