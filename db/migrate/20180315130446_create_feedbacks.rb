class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.string :body
      t.integer :response_id
      t.integer :user_id

      t.timestamps

    end
  end
end
