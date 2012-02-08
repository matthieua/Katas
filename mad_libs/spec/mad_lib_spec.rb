require 'initialiser'

describe MadLib do

  subject { MadLib.new 'samples.madlib' }

  it "should return a MadLib Object" do
    subject.class.should == MadLib
  end

end

