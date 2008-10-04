class CreateAnswerItems < ActiveRecord::Migration
  def self.up
    create_table :answer_items do |t|
      t.integer :answer_profile_id, :null => false
      t.integer :question_id, :null => false
      t.string :answer_detail
      t.timestamp
    end
  end

  def self.down
    drop_table :answer_items
  end
end
