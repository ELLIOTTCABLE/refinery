require File.dirname(__FILE__) + '/../../spec_helper'

describe Object do
  before :each do
    @object = Object.new
  end
  
  describe '#singleton' do
    it 'should return the object\'s singleton class' do
      @object.singleton.should == (class<<@object;self;end)
    end
  end
  
  describe '#primary_ancestor' do
    it 'should return the object\'s class when no singleton is created' do
      @object.primary_ancestor.should == Object
    end
    
    it 'should return the object\'s class when no singleton is created' do
      class << @object
        
      end
      @object.primary_ancestor.should == @object.singleton
    end
  end
end
