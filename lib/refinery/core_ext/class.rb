require 'sing'

class Class
  # Pulls in #singleton?
  include Sing
  
  ##
  # Returns a list of all instances of this class
  def instances
    ObjectSpace.each_object(self).to_a
  end
end