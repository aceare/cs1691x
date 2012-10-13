# Basic Ruby Practice
# Define a method sum which takes an array of integers as an argument and returns the sum of its elements.
def sum(arr)
#  arr.inject { |sum, i| sum+i}
  arr.inject(:+)    # shorter version
end

# p sum([1, 2, 3, 4])

################################################################################
  
# Define a method max_2_sum which takes an array of integers as an argument and
# returns the sum of its two largest elements.
def update_maxs(maxs, i)
  if i >= maxs[1] then maxs[0] = maxs[1]; maxs[1] = i; return maxs end
  if i >  maxs[0] then maxs[0] = i; return maxs end
  return maxs
end

class ErrorShortArray < StandardError ; end

def max_2_sum(arr)
  raise ErrorShortArray if arr.length < 2
=begin
  maxs = Array.new(2)
  if (arr[0] < arr[1]) then
    maxs[0] = arr[0]; maxs[1] = arr[1]
  else
    maxs[0] = arr[1]; maxs[1] = arr[0]
  end 
  arr.drop(2).each { |i| maxs = update_maxs(maxs, i)}
  return maxs[0] + maxs[1]
=end
  # Shorter, better!
  sorted = arr.sort
  sorted[-1] + sorted[-2]
end

#p max_2_sum([3, 4, -3, -1, 5, 0])

################################################################################

# Define a method sum_to_n which takes an array of integers and an integer as
# arguments and returns true if exactly two elements sum to n.

def sum_to_n? arr, n
 hash = Hash.new
 arr.each do |val|
   if hash.key? val
     return true
   else
     hash[n-val] = val
   end
 end
 return false
end

# p sum_to_n?([3, 4, -3, -1, 5, 0], 7)

################################################################################

### Strings and Regular Expressions

# Define a method hello(name) which takes in a string representing a name and prints out
# “Hello, “ followed by the name.


################################################################################

# Define a method starts_with_consonant?(s) which takes in a string and
# returns true if it starts with a consonant and false otherwise.

def starts_with_consonant?(str)
  str =~ /^[^aeiou]/i
end
#p starts_with_consonant? "Apple"
#p starts_with_consonant? "microsoft"

################################################################################

# Define a method binary_multiple_of_4?(s) which takes in a string and
# returns true if it represents a binary number which is a multiple of 4.

def binary_multiple_of_4?(str)
  str =~ /^[01]*1[01]*00$/
end

#p binary_multiple_of_4? "1100"
#p binary_multiple_of_4? "1101"
#p binary_multiple_of_4? "10000"
#p binary_multiple_of_4? "000"
#p binary_multiple_of_4? "HW1000"

################################################################################

=begin
Object Oriented Example
Define a class Car with setters and getters for make, model, and year

Implement self.num_cars_made, which return the total number of cars ever instantiated
Implement self.most_popular_make, which returns the most instantiated car maker
Implement self.been_made?(car_make), which determines if a certain make has been instantiated
Note: maintain your data structures efficiently!

=end

class Car
  @@num_cars_made = 0
  @@make_count    = Hash.new(0)
  
  def initialize(params = {})
    @make   = params[:make]  || 'unknown'
    @model  = params[:model] || 'unknown'
    @year   = params[:year]  || 'unknown'

    @@num_cars_made += 1
    @@make_count[@make] += 1
  end

  def self.num_cars_made
    @@num_cars_made
  end

  def self.most_popular_make
=begin
    max_make = ""
    max_cars = 0
    @@make_count.each { |key, value| if value > max_cars then max_make = key; max_cars = value; end }
    return max_make
=end
    entry = @@make_count.max_by { |make, num| num }
#    entry ? entry.first : nil
    entry ? entry[0] : nil
  end
  
  def self.been_made?(car_make)
#    @@make_count[car_make] == 0 ? false : true
    @@make_count.include? car_make
  end
end

=begin 
Car.new({:make=>"make1", :model=>"model", :year=>1})
Car.new({:make=>"make2", :model=>"model", :year=>1})
Car.new({:make=>"make2", :model=>"model", :year=>1})
Car.new({:make=>"make2", :model=>"model", :year=>1})
Car.new({:make=>"make3", :model=>"model", :year=>1})
Car.new({:make=>"make4", :model=>"model", :year=>1})
Car.new({:make=>"make4", :model=>"model", :year=>1})

p Car.num_cars_made
p Car.most_popular_make
p Car.been_made? "make4"
p Car.been_made? "make14"
=end

################################################################################

# Fibonacci, yield and x,y = y,x+y
def fibon(n)
  i,j = 0,1
  n.times do
    yield i
# NOTE, "Original" i is used in j=i+j!!!!
    i,j = j,i+j
  end
end

fibon(9) {|i| puts i}


class C
  def to_s()
    puts self.class
  end
end

class B < C ; end
class A < B ; end

a = A.new
b = B.new
c = C.new
