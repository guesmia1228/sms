class Student < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_save :generate_random_number

  has_one :student_courses
  has_one :course, through: :student_courses

  private
  
  def random_number
    "#{Date.today.year}-#{rand(0..1000000)}"
  end
end