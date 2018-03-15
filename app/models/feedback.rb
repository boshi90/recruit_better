class Feedback < ApplicationRecord
  # Direct associations

  belongs_to :reviewer,
             :class_name => "User",
             :foreign_key => "user_id"

  belongs_to :response

  # Indirect associations

  # Validations

end
