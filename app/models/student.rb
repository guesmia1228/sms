class Student < ApplicationRecord
  validates :name, presence: true
  before_save :generate_random_number_registration

  has_one :student_courses
  has_one :course, through: :student_courses

  def generate_random_number_registration
    number_generate = random_number
    while Student.exists?(registration: number_generate)
      number_generate = random_number
    end
    self.registration = number_generate
  end

  def random_number
    "#{Date.today.year}-#{rand(0..1000000)}"
  end
end
