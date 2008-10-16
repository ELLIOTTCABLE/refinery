class Object
  ##
  # Returns the singleton class for this object.
  # 
  # @return Class this object's singleton class
  def singleton
    class<<self;self;end
  end
end
