class Target < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :company

  # Indirect associations

  # Validations

end
