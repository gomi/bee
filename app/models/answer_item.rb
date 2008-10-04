class AnswerItem < ActiveRecord::Base
  belongs_to :answer_profile
  belongs_to :question
end
