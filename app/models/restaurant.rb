class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  AUTHORIZED_CATEGORY = %w[chinese italian japanese french belgian].freeze
  validates :name, presence: true
  validates :adress, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: AUTHORIZED_CATEGORY }
end
