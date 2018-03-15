class Target < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "applicant_id"

  belongs_to :company

  # Indirect associations

  # Validations

end
