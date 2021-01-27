class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :person_tags, dependent: :destroy
  has_many :people, -> { distinct }, through: :person_tags
end
