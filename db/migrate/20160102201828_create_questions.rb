class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.references :event_session, index: true, foreign_key: true
      t.integer :vote_count ,:default=>0
      t.integer :status,:default=>0

      t.timestamps null: false
    end
  end
end
