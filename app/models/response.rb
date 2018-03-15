class Response < ApplicationRecord
  # Direct associations

  has_many   :feedbacks,
             :dependent => :destroy

  belongs_to :question

  # Indirect associations

  # Validations

end
