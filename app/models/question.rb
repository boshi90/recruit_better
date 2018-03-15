class Question < ApplicationRecord
  # Direct associations

  has_many   :asks,
             :dependent => :destroy

  has_many   :responses,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :responses,
             :source => :user

  has_many   :companies,
             :through => :asks,
             :source => :company

  # Validations

end
