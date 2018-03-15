class Company < ApplicationRecord
  # Direct associations

  has_many   :asks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
