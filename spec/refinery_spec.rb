require File.dirname(__FILE__) + '/spec_helper'

describe Refinery do
  before :each do
    # Kind of hackish, but I'd rather refer to it by it's name as a class.
    Object.send :remove_const, :Something if defined? Something
  end
  
  describe '#refine_method' do
    describe '- instance method' do
      
      it 'should still work ordinarily when defined before refining' do
        class Something
          attr_reader :abc
          extend Refinery
          
          def foobar
            @abc = 123
          end
          refine_method :foobar
        end
        
        something = Something.new
        something.foobar
        something.abc.should == 123
      end
      
      it 'should still work ordinarily when not defined before refining' do
        class Something
          attr_reader :abc
          extend Refinery
          
          refine_method :foobar
          def foobar
            @abc = 123
          end
        end
        
        something = Something.new
        something.foobar
        something.abc.should == 123
      end
      
      it 'should stack when defined multiple times after refining' do; pending do
        class Something
          attr_reader :abc
          extend Refinery
          
          refine_method :foobar
          def foobar
            @abc = 123
          end
          
          def foobar
            @abc += 111
          end
          
          def foobar
            @abc += 111
          end
        end
        
        something = Something.new
        something.foobar
        something.abc.should == 345
      end; end
      
      it 'should stack when defined before and after refining' do; pending do
        class Something
          attr_reader :abc
          extend Refinery
          
          def foobar
            @abc = 123
          end
          refine_method :foobar
          
          def foobar
            @abc += 111
          end
        end
        
        something = Something.new
        something.foobar
        something.abc.should == 234
      end; end
      
    end
    
    describe '- singleton method' do
      
      it 'should still work ordinarily when defined before refining' do
        class Something; class << self
          attr_reader :abc
          extend Refinery
          
          def foobar
            @abc = 123
          end
          refine_method :foobar
        end; end
        
        Something.foobar
        Something.abc.should == 123
      end
      
      it 'should still work ordinarily when not defined before refining' do
        class Something; class << self
          attr_reader :abc
          extend Refinery
          
          refine_method :foobar
          def foobar
            @abc = 123
          end
        end; end
        
        Something.foobar
        Something.abc.should == 123
      end
      
      it 'should stack when defined multiple times after refining' do; pending do
        class Something; class << self
          attr_reader :abc
          extend Refinery
          
          refine_method :foobar
          def foobar
            @abc = 123
          end
          
          def foobar
            @abc += 111
          end
          
          def foobar
            @abc += 111
          end
        end; end
        
        Something.foobar
        Something.abc.should == 345
      end; end
      
      it 'should stack when defined before and after refining' do; pending do
        class Something; class << self
          attr_reader :abc
          extend Refinery
          
          def foobar
            @abc = 123
          end
          refine_method :foobar
          
          def foobar
            @abc += 111
          end
        end; end
        
        Something.foobar
        Something.abc.should == 234
      end; end
      
    end
  end
   
end