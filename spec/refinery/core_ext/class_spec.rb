require File.dirname(__FILE__) + '/../../spec_helper'

describe Class do
  describe '#is_singleton?' do
    
    it 'should return false for a normal class' do
      klass = Class.new
      klass.should_not be_singleton
    end
    
    it 'should return true for a singleton class' do
      klass = Class.new
      sing = klass.class_eval { class << self; self; end }
      sing.should be_singleton
    end
    
  end
end
