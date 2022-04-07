class Student < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_save :generate_random_number

  has_one :student_course, class_name: 'StudentCourse'
  has_one :course, through: :student_course

  def identifier_prefix
    "#{Date.today.year}-"
  end
end