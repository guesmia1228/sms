class Student < ApplicationRecord
  validates :name, presence: true
  before_save :generate_random_number_registration

  def generate_random_number_registration
    number = "#{Date.today.year}-#{rand(0..1000000)}"
    while Student.exists?(:registration => number)
      number = "#{Date.today.year}-#{rand(0..1000000)}"
    end
    self.registration = number
  end
end
