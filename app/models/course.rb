class Course < ApplicationRecord
  validates :name, presence: true
  before_save :generate_random_number_indentifier

  has_many :student_courses
  has_many :students, through: :student_courses

  def generate_random_number_indentifier
    number_generate = random_number
    while Course.exists?(indentifier: number_generate)
      number_generate = random_number
    end
    self.indentifier = number_generate
  end

  def random_number
    "#{rand(0..1000000)}"
  end
end
