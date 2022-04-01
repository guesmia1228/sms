class Student < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_save :generate_random_number

  has_one :student_courses
  has_one :course, through: :student_courses

  def identifier_prefix
    "#{Date.today.year}-"
  end
end