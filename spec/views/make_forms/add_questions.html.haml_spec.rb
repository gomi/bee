# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/make_forms/add_questions" do
  describe "new questions" do
    before do
      assigns[:questionnarie] =Questionnarie.create(:title => 'タイトル')
      questions = []
      3.times{ questions << Question.new()}
      assigns[:questions] = questions
      render '/make_forms/add_questions'
    end

    it "initial display" do
      response.should have_tag("table#questions") do
        [0,1,2].each do |i|
          with_tag("input#question_#{i}_order", "")
          with_tag("textarea#question_#{i}_sentences", "")
          with_tag("input#question_#{i}_need", "")
        end
      end
    end
  end

end
