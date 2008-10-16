class Class
  ##
  # Lists of all instances of this class
  # 
  # @return Array all instances of this class currently known to Ruby's ObjectSpace
  def instances
    ObjectSpace.each_object(self).to_a
  end
  
  ##
  # Returns the singleton metaclass, aka eigenclass, for this class.
  # 
  # @return Class this object's singleton metaclass, aka eigenclass
  alias_method :eigenclass, :singleton
end
