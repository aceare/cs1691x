=begin
  An anagram is a word obtained by rearranging the letters of another word.
  For example, "rats", "tars" and "star" are an anagram group because they are
  made up of the same letters.

  Write a method combine_anagrams(words) that, given an array of strings words,
  returns the array of anagram groups formed from the input words.
  Case doesn't matter in classifying strings as anagrams (but case should be
  preserved in the output), and the order of the anagrams in the groups doesn't matter.

  Example test case:

  # input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] 
  # output: [ ["cars", "racs", "scar"],
  #           ["four"],
  #           ["for"],
  #           ["potatoes"],
  #           ["creams", "scream"] ]

  Hint: you can quickly tell if two words are anagrams by sorting their letters,
  keeping in mind that upper vs. lowercase doesn't matter. 
=end

def anagram_key(word)
  anagram_key_array = word.downcase.split(//)   # make array of characters of the word
  return anagram_key_array.sort * ""            # sort the array and convert it to string (multiply by "")
end

def combine_anagrams(words)
#  output_hash = Hash.new([])  # NOTE: when key is not found, second instance returns EXISTING array!!!!!
  output_hash = Hash.new { |hash, key| hash[key] = [] } # when key is not found, return []

  words.each do |word|
    key = anagram_key(word)
    output_hash[key] = output_hash[key] << word
  end
  
  return output_hash.values
end

#input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
#p combine_anagrams(input)
# output: [ ["cars", "racs", "scar"],
#           ["four"],
#           ["for"],
#           ["potatoes"],
#           ["creams", "scream"] ]
