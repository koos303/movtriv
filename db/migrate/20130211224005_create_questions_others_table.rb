class CreateQuestionsOthersTable < ActiveRecord::Migration
  def up
    create_table :questions_others, :id => false do |t|
      t.integer :question_id
      t.integer :movie_id
    end

    add_index(:questions_others, [:question_id, :movie_id], :unique => true)
  end

  def down
    drop_table :questions_others
  end
end
