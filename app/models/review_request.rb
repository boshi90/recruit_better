class ReviewRequest < ApplicationRecord
  # Direct associations

  belongs_to :applicant,
             :class_name => "User"

  # Indirect associations

  # Validations

end
