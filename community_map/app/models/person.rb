class Person < ApplicationRecord
  validates :name, presence: true
  validates :pronouns, presence: true

  has_many :person_tags, dependent: :destroy
  has_many :tags, -> {distinct}, through: :person_tags
end
