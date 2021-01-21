require 'rails_helper'

describe Person do
  context 'when a person is created' do

    subject do
      Person.new(
        name: 'test human',
        pronouns: 'they, them',
      )
    end

    it 'is not associated with a tag' do
      expect(subject.tags).to be_empty
    end
  end
end
