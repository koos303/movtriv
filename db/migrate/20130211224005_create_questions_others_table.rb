class CreateQuestionsOthersTable < ActiveRecord::Migration
  def up
    create_table :questions_others, :id => false do |t|
      t.integer :question_id
      t.integer :movie_id
    end
  end

  def down
    drop_table :questions_others
  end
end
