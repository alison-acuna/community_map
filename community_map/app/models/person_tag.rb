class PersonTag < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :tag, optional: true
end
