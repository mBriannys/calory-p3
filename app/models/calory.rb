class Calory < ApplicationRecord
  belongs_to :user
  validates :ingested_calories, presence: true
  validates :burned_calories, presence: true
  validates :comment_ingested, presence: true
  validates :comment_burned, presence: true
  paginates_per 5
end
