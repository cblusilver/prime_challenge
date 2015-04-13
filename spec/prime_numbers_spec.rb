require 'spec_helper'
 
describe Prime do

  before :each do
    @expected_array = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    @prime = Prime.new
  end

  it "should return the correct values for a numeral passed" do
    expect(@prime.get_numbers(10)).to match_array(@expected_array)
  end

  it "should return the correct values for a numeric string passed" do
    expect(@prime.get_numbers("10")).to match_array(@expected_array)
  end

  it "should raise an ArgumentError error if a non-numeral was passed" do
    expect { @prime.get_numbers("foo") }.to raise_error(ArgumentError)
  end

  it "should return an array with 10 elements if 10 is passed" do
    expect(@prime.get_numbers(10)).to be_an_instance_of(Array)
  end

  it "should returns an empty array if 0 is passed" do
    expect(@prime.get_numbers(0)).to be_an_instance_of(Array)
  end

  it "should raise an ArgumentError error if -1 is passed" do
    expect { @prime.get_numbers(-1) }.to raise_error(ArgumentError)
  end
end