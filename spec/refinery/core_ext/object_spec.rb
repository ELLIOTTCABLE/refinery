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
  
  describe '#defacto_class' do
    it 'should return the object\'s class when no singleton is created' do
      @object.defacto_class.should == Object
    end
    
    it 'should return the object\'s singleton when a singleton is created' do
      singleton = @object.singleton
      @object.defacto_class.should == singleton
    end
  end
end
