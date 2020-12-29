class Person < ApplicationRecord
  validates :name, presence: true
  validates :pronouns, presence: true
end
