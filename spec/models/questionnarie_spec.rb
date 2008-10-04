require File.dirname(__FILE__) + '/../spec_helper'

describe Questionnarie, 'validations' do
  before(:each) do
    @questionnarie  = Questionnarie.new(:title=>"mytitle",:description=>"description",:limit=>"20081231",:publication=>"public",:note=>"mynote")
  end
  
  it 'none title is NG' do
    @questionnarie.title = ""
    @questionnarie.should_not be_valid
  end
  
  it 'none limit is NG' do
    @questionnarie.limit=""
    @questionnarie.should_not be_valid
  end
  
  it 'none publication is NG' do
    @questionnarie.publication= ""
    @questionnarie.should_not be_valid
  end

  it 'only title,limit,publication is OK' do
    @questionnarie.description= ""
    @questionnarie.note= ""
    @questionnarie.should be_valid
  end

  it 'fill all is OK' do
    @questionnarie.should be_valid
  end

  it 'title > 100 is NG' do
    @questionnarie.title= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde1"
    @questionnarie.should_not be_valid
  end

  it 'description > 100 is NG' do
    @questionnarie.description= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde1"
    @questionnarie.should_not be_valid
  end

  it 'publication > 100 is NG' do
    @questionnarie.publication= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde1"
    @questionnarie.should_not be_valid
  end

  it 'note > 100 is NG' do
    @questionnarie.note= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde1"
    @questionnarie.should_not be_valid
  end

  it 'title = 100 is OK' do
    @questionnarie.title= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde"
    @questionnarie.should be_valid
  end

  it 'description = 100 is OK' do
    @questionnarie.description= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde"
    @questionnarie.should be_valid
  end

  it 'publication = 100 is OK' do
    @questionnarie.publication= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde"
    @questionnarie.should be_valid
  end

  it 'note = 100 is OK' do
    @questionnarie.note= "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde"
    @questionnarie.should be_valid
  end
end
