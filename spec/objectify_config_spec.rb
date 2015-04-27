require 'spec_helper.rb'

describe 'ObjectifyConfig' do

  before :all do
    ObjectifyConfig.configuration_files(File.join(File.dirname(__FILE__), "object_test.yml"))
    ObjectifyConfig.run
  end

  it 'should fetch the new_value by sending message to it' do
    expect(ObjectTestConfig.new_value).to eq(1)
  end


  it 'should fetch the values at level 2' do
    expect(ObjectTestConfig.abc.yab).to eq(2)
    expect(ObjectTestConfig.abc.blah).to eq(3)
  end

  it 'should fetch the values at level 3' do
    expect(ObjectTestConfig.person.address.building_number).to eq(23)
  end

  it 'should fetch the values for arbitrary level of nesting' do
    expect(ObjectTestConfig.programming.functional.pure.dependent_types.idris).to eq('awesomeness')

    expect(ObjectTestConfig.programming.functional.pure.non_dependent_types.haskell).to eq('rocks')

    expect(ObjectTestConfig.programming.functional.impure.clojure).to eq('cool')
  end
end
