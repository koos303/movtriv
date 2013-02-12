class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :answer

      t.timestamps
    end

    add_index(:questions, :answer_id, :unique => true)
  end
end
