class Company < ApplicationRecord
  mount_uploader :logo, LogoUploader

  # Direct associations

  has_many   :targets,
             :dependent => :destroy

  has_many   :asks,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :targets,
             :source => :user

  has_many   :questions,
             :through => :asks,
             :source => :question

  # Validations

end
