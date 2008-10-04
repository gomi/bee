require File.dirname(__FILE__) + '/../spec_helper'

describe AnswerItem do
  before(:each) do
    @answer_item = AnswerItem.new
  end

  it "should be valid" do
    @answer_item.should be_valid
  end
end
