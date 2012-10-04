=begin
  (a) Base class
  Create a class Dessert with getters and setters for name and calories.
  Define instance methods healthy?, which returns true if a dessert has
  less than 200 calories, and delicious? which returns true for all desserts. 
=end

class Dessert
  attr_accessor :name, :calories
  
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def healthy?
    @calories < 200
  end
  
  def delicious?
    return true
  end
end

=begin
  (b) Derived class
  Create a class JellyBean that extends Dessert, and add a getter and setter for flavor.
  Modify delicious? to return false if the flavor is "black licorice" (but delicious? should
  still return true for all other flavors and for all non-JellyBean desserts).
=end
class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  
  def delicious?
    return false if @flavor == "black licorice"
    return true
  end
end

=begin
  j0 = Dessert.new("j0", 500)
  j1 = JellyBean.new("j1", 100, "j1 flavor")
  j2 = JellyBean.new("j2", 300, "black licorice")
  
  p j0.name
  p j0.healthy?
  p j1.name
  p j1.delicious?
  p j2.name
  p j2.healthy?
  j2.calories = 100
  p j2.calories
  p j2.healthy?
  p j2.delicious?
=end
