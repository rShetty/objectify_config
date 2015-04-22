require 'spec_helper.rb'

describe 'ObjectifyConfig' do

  it 'should do something' do
    ObjectifyConfig.configuration_files(File.join(File.dirname(__FILE__), "object_test.yml"))
    ObjectifyConfig.run
    expect(ObjectTestConfig.new_value).to eq(1)
  end
end
