class Company < ApplicationRecord
  # Direct associations

  has_many   :targets,
             :dependent => :destroy

  has_many   :asks,
             :dependent => :destroy

  # Indirect associations

  has_many   :questions,
             :through => :asks,
             :source => :question

  # Validations

end
