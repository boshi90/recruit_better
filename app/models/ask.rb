class Ask < ApplicationRecord
  # Direct associations

  belongs_to :question

  belongs_to :company

  # Indirect associations

  # Validations

end
