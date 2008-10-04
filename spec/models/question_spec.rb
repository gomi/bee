require File.dirname(__FILE__) + '/../spec_helper'

describe Question do
  before(:each) do
    @question = Question.new(:order=>"1",:sentences=>"sentences",:need=>true)
  end

  it 'none order is NG' do
    @question.order = ""
    @question.should_not be_valid
  end

  it 'none sentences is NG' do
    @question.sentences = ""
    @question.should_not be_valid
  end
  
  it 'only order,sentences is OK' do
    @question.need = nil
    @question.should be_valid
  end

  it 'fill all is OK' do
    @question.should be_valid
  end

  it 'sentences > 100 is NG' do
    @question.sentences= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde1"
    @question.should_not be_valid
  end
 
  it 'sentences = 100 is OK' do
    @question.sentences= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde"
    @question.should be_valid
  end

  it 'need = false is OK' do
    @question.need= false
    @question.should be_valid
  end

end
