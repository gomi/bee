class Questionnarie < ActiveRecord::Base
  has_many :questions
  has_many :answer_profiles
  validates_presence_of :title, :message =>'は必須です'
  validates_presence_of :limit, :message =>'は必須です'
  validates_presence_of :publication, :message =>'は必須です'

  validates_length_of :title,:description,:publication,:note, :maximum=> 100, :message =>'は100文字以内で入力してください'
  #validates_length_of :description, :maximum=> 100, :message =>'は100文字以内で入力してください'
  #validates_length_of :publication, :maximum=> 100, :message =>'は100文字以内で入力してください'
  #validates_length_of :note, :maximum=> 100, :message =>'は100文字以内で入力してください'

end
