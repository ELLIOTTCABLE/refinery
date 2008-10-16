require File.dirname(__FILE__) + '/../../spec_helper'

describe Class do
  before :each do
    @klass = Class.new
  end
  
  describe '#eigen?' do
    
    it 'should return false for a normal class' do
      @klass.should_not be_eigen
    end
    
    it 'should return true for an eigenclass' do
      @klass.eigenclass.should be_eigen
    end
    
    it 'should return true for a metaeigenclass' do
      @klass.eigenclass.eigenclass.should be_eigen
    end
    
  end
  
  describe '#instances' do
    
    it 'should return all instances of a class currently present in the Ruby ObjectSpace' do
      instance1 = @klass.new
      instance2 = @klass.new
      instance3 = @klass.new
      [instance1, instance2, instance3].each {|instance| @klass.instances.should include(instance) } 
    end
    
  end
end
