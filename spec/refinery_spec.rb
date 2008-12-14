require File.dirname(__FILE__) + '/spec_helper'

describe Refinery do
  before :each do
    # Kind of hackish, but I'd rather refer to it by it's name as a class.
    Object.send :remove_const, :Something if defined? Something
  end
  
  describe ' - a refined method' do
    before :each do
      @class = Class.new
    end
    
    describe 'in a non-singleton' do
      
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
    
    describe 'in a singleton' do
      before :each do
        @class = @class.singleton
        @class.send :extend, Refinery
        @class.send :attr_reader, :counter
      end
      
      describe 'with a method', :shared => true do
        before :each do
          @class.class_eval do
            refine_method :a_method
          end
        end
        
        it 'should stack definitions' do; pending do
          counter = @counter
          @class.class_eval do
            define_method :a_method do
              counter.foo
            end
            
            define_method :a_method do
              counter.foo
            end
          end
          
          @counter.should_receive(:foo).exactly(3).times
          @class.instance.a_method
        end; end
      end
      
      describe '(undefined)' do
        it_should_behave_like 'with a method'
        
        it 'should still raise an error if left undefined' do
          lambda { @class.instance.a_method } .should raise_error(NoMethodError,
            /undefined method `a_method' for/)
        end
      end
      
      describe '(pre-defined)' do
        before :each do
          # Have to use a local variable here to get into scope
          @counter = counter = mock(:counter, :null_object => true)
          @class.class_eval do
            define_method :a_method do
              counter.gaz
              return 'return value'
            end
          end
        end
        
        it_should_behave_like 'with a method'
        
        it 'should be executed' do
          @counter.should_receive :gaz
          @class.instance.a_method
        end
        
        it 'should return the return value' do
          @class.instance.a_method.should == 'return value'
        end
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