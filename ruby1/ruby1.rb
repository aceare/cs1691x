# Singleton, class variable, class method
class Logger
  private_class_method :new
  @@logger = nil
  
  def Logger.create
    @@logger = new unless @@logger
    @@logger
  end
end # Logger

class Song
  
  @@count = 0
  MaxTime = 5*60

# getters, setters  
  attr_reader :name, :artist, :duration
  attr_writer :name, :duration

# protected: class method can access *another object* of this class hierarchy
  attr_reader :price
  protected   :price    # useful for comparing price of current instance with another
  
# private: class method can access *only this instance* within this class hierarchy
  attr_writer :price
  private     :price=   # useful to block current instance modifying price of another
  
  def initialize(name, artist, price, duration=0)
    @name     = name
    @artist   = artist
    @price    = price
    @duration = duration
    
    @@count   += 1
  end
  
  def to_s
    super + ": name #{@name}, artist #{@artist}, price #{@price}, , duration #{@duration}"
  end
  
  def durationInMinutes
    @duration / 60.0
  end

# Virtual Attribute
  def durationInMinutes=(mins)
    @duration = mins * 60
  end

# Class variable
  def Song.count
    @@count
  end
  
  def <=> (other)
    @price <=> other.price
  end
  
end # Song

class KaraokeSong < Song
  
#  attr_access :lyrics
  
  def initialize(name, artist, price, duration, lyrics)
    super(name, artist, price, duration)
    @lyrics   = lyrics
    @price = 321
    p "price #{@price}"
  end
  
  def to_s
    super + " [#{@lyrics}]"
  end
end # KaraokeSong


song1 = Song.new("song_n1", "artist_n1", 100, 15)
p song1.to_s

song2 = KaraokeSong.new("song_n2", "artist_n1", 200, 11, "lyrics text")
p song2.to_s

p song1.name
p "song1.durationInMinutes " + song1.durationInMinutes.to_s

song2.durationInMinutes = 10
p "song2.duration " + song2.duration.to_s

p "total count #{Song.count}"

p "song1 <=> song2) #{song1 <=> song2}"

logger1 = Logger.create
p logger1.to_s
logger2 = Logger.create
p logger2.to_s

value1 = "10"
value2 = value1
value1[0] = "2"

#p value1.object
#p value2.object
#p "value1=#{value1}, value2=#{value2}"

rx = {:fox=>/^arm/, 'fox'=>[%r{AN(DO)$}, /an(d0)/i]}
# "armando" =~ rx{:fox}
# rx[:fox][1] =~ "ARMANDO"
# rx['fox'][1] =~ "ARMANDO"
# "armando" =~ rx['fox', 1]

p rx['fox'][1] =~ "ARMANDO"


t = ['banana', 'anana', 'naan'].map do |food|
  food.reverse
end.select {|f| f.match /^a/}
p 't is ' + t.to_s

