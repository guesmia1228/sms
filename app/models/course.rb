class Course < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_save :generate_random_number

  has_many :student_courses
  has_many :students, through: :student_courses

  has_many :couse_subject
  has_many :college_subject, through: :couse_subject
end
