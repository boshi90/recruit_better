class Feedback < ApplicationRecord
  # Direct associations

  belongs_to :reviewer,
             :class_name => "User"

  belongs_to :response

  # Indirect associations

  has_one    :applicant,
             :through => :response,
             :source => :applicant

  # Validations

end
