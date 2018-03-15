class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :body
      t.integer :response_id
      t.integer :reviewer_id

      t.timestamps

    end
  end
end
