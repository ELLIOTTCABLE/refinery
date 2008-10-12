class Object
  ##
  # Returns the singleton class for this object.
  def singleton
    class<<self;self;end
  end
end