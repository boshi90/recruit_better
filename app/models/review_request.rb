class ReviewRequest < ApplicationRecord
  # Direct associations

  belongs_to :reviewer,
             :class_name => "User"

  belongs_to :applicant,
             :class_name => "User"

  # Indirect associations

  # Validations

end
