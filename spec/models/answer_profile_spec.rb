require File.dirname(__FILE__) + '/../spec_helper'

describe AnswerProfile do
  before(:each) do
    @answer_profile = AnswerProfile.new
  end

  it "should be valid" do
    @answer_profile.should be_valid
  end
end
