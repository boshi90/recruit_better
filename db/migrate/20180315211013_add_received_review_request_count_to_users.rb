class AddReceivedReviewRequestCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :received_review_requests_count, :integer
  end
end
