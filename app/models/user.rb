class User < ApplicationRecord
  # Direct associations

  has_many   :received_review_requests,
             :class_name => "ReviewRequest",
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :provided_feedbacks,
             :class_name => "Feedback",
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :targets,
             :foreign_key => "applicant_id",
             :dependent => :destroy

  has_many   :responses,
             :foreign_key => "applicant_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :reviewers,
             :through => :received_feedbacks,
             :source => :reviewer

  has_many   :applicants,
             :through => :provided_feedbacks,
             :source => :applicant

  has_many   :answered_questions,
             :through => :responses,
             :source => :question

  has_many   :target_companies,
             :through => :targets,
             :source => :company

  has_many   :received_feedbacks,
             :through => :responses,
             :source => :feedbacks

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
