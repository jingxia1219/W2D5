# require 'byebug'
class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    raise "Out of bounds" if num > @max  || num < 0 
    @store[num] = true 
  end

  def remove(num)
    raise "this is out of bounds" unless is_valid?(num) 
    @store[num] = false 
  end

  def include?(num)
    raise "this is out of bounds" if num > @max || num < 0 
    @store[num]
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0 
  end

  def validate!(num)
    
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if num_buckets == @count
     unless self.include?(num)
       self[num] << num
       @count += 1
     end 
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num) 
      @count -= 1 
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets*2
    # @store = Array.new(num_buckets) { Array.new }
    old_store = @store
    @store = Array.new(new_size) { Array.new }
    old_store.flatten.each_with_index { |el, idx| @store[el] << el }
  end
end
