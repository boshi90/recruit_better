class Response < ApplicationRecord
  # Direct associations

  belongs_to :applicant,
             :class_name => "User"

  has_many   :sent_review_requests,
             :class_name => "ReviewRequest",
             :dependent => :destroy

  has_many   :feedbacks,
             :dependent => :destroy

  belongs_to :question

  # Indirect associations

  # Validations

end
