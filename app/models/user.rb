class User < ApplicationRecord
  # Direct associations

  has_many   :received_review_requests,
             :class_name => "ReviewRequest",
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :sent_review_requests,
             :class_name => "ReviewRequest",
             :foreign_key => "applicant_id",
             :dependent => :destroy

  has_many   :feedbacks,
             :dependent => :destroy

  has_many   :targets,
             :dependent => :destroy

  has_many   :responses,
             :dependent => :destroy

  # Indirect associations

  has_many   :reviewers,
             :through => :received_review_requests,
             :source => :applicant

  has_many   :applicants,
             :through => :sent_review_requests,
             :source => :reviewer

  has_many   :answered_questions,
             :through => :responses,
             :source => :question

  has_many   :target_companies,
             :through => :targets,
             :source => :company

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
