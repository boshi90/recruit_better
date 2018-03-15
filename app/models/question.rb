class Question < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
