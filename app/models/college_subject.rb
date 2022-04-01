class CollegeSubject < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_save :generate_random_number

  has_many :couse_subject
  has_many :course, through: :couse_subject
end
