class Question < ActiveRecord::Base
  belongs_to :questionnarie
  has_many :answer_items
  
  validates_presence_of :order, :sentences, :message =>'は必須です'
  validates_length_of   :sentences, :maximum=>100, :message =>'は100桁以内で入力してください'
  #validates_format_of :need, :message =>'は必須です。記号はハイフン「-」 アンダーバー「_」のみ使えます', :with => /^[\wa-zA-Z0-9\-_()\\!?]*$/
  
end
