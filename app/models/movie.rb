class Movie < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 150 }

  validates :description, presence: true
  validates :description, length: { maximum: 500 }

  validates :releaseyear, length: { is: 4 } #supports only years
  validates :releaseyear, numericality: { only_integer: true }

  validates :duration, presence: true
  validates :duration, numericality: { only_integer: true }

  has_many :ratings
end
