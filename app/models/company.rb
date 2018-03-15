class Company < ApplicationRecord
  # Direct associations

  has_many   :targets,
             :dependent => :destroy

  has_many   :asks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
