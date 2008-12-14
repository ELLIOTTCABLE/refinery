require 'eigen'
require 'defacto'
require 'refinery/core_ext/object'
require 'refinery/core_ext/class'

module Refinery
  Version = 0
  
  # This refines an instance method named 'meth'.
  def refine_method meth
    (@@refined_methods ||= Hash.new)[meth] = Array.new
    
    
  end
  
end