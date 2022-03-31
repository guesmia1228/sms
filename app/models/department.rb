class Department < ApplicationRecord
  include GenerateRandomNumber
  validates :name, presence: true
  before_save :generate_random_number

  private
  def random_number
    "#{rand(0..1000000)}"
  end
end
