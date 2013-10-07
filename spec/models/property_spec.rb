require 'spec_helper'

describe 'Property' do
  it 'responds to new' do
    Property.new(id:1).id.should eq 1
  end
end