require File.dirname(__FILE__) + '/../../spec_helper'

describe Class do
  before :each do
    @class = Class.new
  end
  
  describe '#eigen?' do
    
    it 'should return false for a normal class' do
      @class.should_not be_eigen
    end
    
    it 'should return true for an eigenclass' do
      @class.eigenclass.should be_eigen
    end
    
    it 'should return true for a metaeigenclass' do
      @class.eigenclass.eigenclass.should be_eigen
    end
    
  end
  
  describe '#instances' do
    
    it 'should return all instances of a class currently present in the Ruby ObjectSpace' do
      examples = [@class.new, @class.new, @class.new]
      examples.each {|instance| @class.instances.should include(instance) } 
    end
    
  end
end
