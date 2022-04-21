class CollegeSubject < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_save :generate_random_number
  belongs_to :department

  has_many :couse_subjects
  has_many :courses, through: :couse_subjects
end
