class Department < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_create :generate_random_number

  has_many :college_subjects
end
