class CreateReviewRequests < ActiveRecord::Migration
  def change
    create_table :review_requests do |t|
      t.integer :reviewer_id
      t.integer :response_id

      t.timestamps

    end
  end
end
