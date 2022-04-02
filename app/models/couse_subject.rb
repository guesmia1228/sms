class CouseSubject < ApplicationRecord
  belongs_to :college_subject
  belongs_to :course
end