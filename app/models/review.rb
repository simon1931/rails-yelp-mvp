class Review < ApplicationRecord
  belongs_to :restaurant

  AUTHORIZED_RATING = (0..5).freeze
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: AUTHORIZED_RATING }
end
