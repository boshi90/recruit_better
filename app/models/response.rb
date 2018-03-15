class Response < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :feedbacks,
             :dependent => :destroy

  belongs_to :question

  # Indirect associations

  # Validations

end
