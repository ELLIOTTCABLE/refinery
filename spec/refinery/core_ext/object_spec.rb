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
end
