class AnswerProfile < ActiveRecord::Base
  belongs_to :questionnarie
  has_many :answer_items
  
  def hashed_answer_items
    hashed_items = {}
    answer_items.each do |item|
      hashed_items[item.question.order] = item
    end
    p hashed_items
    return hashed_items
  end
end
