require File.dirname(__FILE__) + '/../test_helper'

class QuestionnarieTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_create
    questionnarie  = Questionnarie.new(:title=>"mytitle",:limit=>"20081231",:publication=>"public",:note=>"mynote")
 
    null_title = questionnarie.clone
    null_title.title = ""
    assert !null_title.save

    null_limit = questionnarie.clone
    null_limit.limit= ""
    assert !null_limit.save

    null_publication = questionnarie.clone
    null_publication.publication= ""
    assert !null_publication.save
    
    
  end
end
