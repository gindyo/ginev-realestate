require 'spec_helper'
describe Repo do 
  it 'returns all' do
    Repo.all.should be_instance_of Array 
  end
end