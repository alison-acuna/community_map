class Person < ApplicationRecord
  validates :name, presence: true
  validates :pronouns, presence: true
  has_many :person_tags, -> { order(rank: :asc) }
  has_many :tags, through: :person_tags
end
