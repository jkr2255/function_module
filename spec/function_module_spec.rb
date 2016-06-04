require 'spec_helper'

describe FunctionModule do
  it 'has a version number' do
    expect(FunctionModule::VERSION).not_to be nil
  end
end

describe 'Module#module_functions' do
  it 'is a public method' do
    expect(Module).to be_method_defined(:module_functions)
  end

  it 'returns empty array with empty Module' do
    expect(Module.new.module_functions).to eq []
  end

  it 'returns properly with methods defined by module_function' do
    module Test1 # :nodoc:
      def foo; end
      module_function :foo
    end
    expect(Test1.module_functions).to eq [:foo]
  end

  it 'doesn\'t count singular/private only methods' do
    module Test2 # :nodoc:
      def self.bar; end
      def baz; end
      private :baz
    end
    expect(Test2.module_functions).to eq []
  end

  it 'doesn\'t count singular & public methods' do
    module Test3 # :nodoc:
      def self.hoge; end
      def hoge; end
    end
    expect(Test3.module_functions).to eq []
  end
end

describe 'Module#include_module_functions' do
  it 'is a private method' do
    expect(Module).to be_private_method_defined(:include_module_functions)
  end

  it 'introduces other Module\'s module functions' do
    module Test5
      include_module_functions Math
    end
    expect(Test5).to respond_to(:sin)
    expect(Test5).to be_private_method_defined(:sin)
  end

  describe 'Module#alias_module_function' do
    it 'is a private method' do
      expect(Module).to be_private_method_defined(:alias_module_function)
    end

    it 'copies module function' do
      module Test6
        def foo; end
        module_function :foo
        alias_module_function :bar, :foo
      end
      expect(Test6).to respond_to(:bar)
      expect(Test6).to be_private_method_defined(:bar)
    end
  end
end
