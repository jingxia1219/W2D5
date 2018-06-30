class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_id = ""
    # hash_id += el.object_id
    self.each { |el| hash_id << "#{el.object_id}" unless self.empty? }
    hash_id.to_i
  end
end

class String
  def hash
    hash_id = ""
    h = Hash.new(0)
    # hash_id += el.object_id
    letters = ("a".."z").to_a
    letters.each_with_index do |c,idx|
      h[c] = idx 
    end 
    self.each_char do  |c|
      hash_id << "#{h[c].object_id}" unless self.empty?
    end 
    hash_id.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # to_a.sort_by(&:hash).hash
    return 0 if self.empty?
    hash_id = 0
    self.each do |k,v| 
     hash_id += ("#{k.hash}" + "#{v.hash}").to_i
    end 
    hash_id
  end
end
