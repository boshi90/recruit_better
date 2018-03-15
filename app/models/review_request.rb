class ReviewRequest < ApplicationRecord
  # Direct associations

  belongs_to :reviewer,
             :class_name => "User",
             :counter_cache => :received_review_requests_count

  belongs_to :response

  # Indirect associations

  # Validations

end
