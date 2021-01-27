class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :person_tags
  has_many :people, through: :person_tags
end
