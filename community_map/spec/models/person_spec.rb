require 'rails_helper'

describe Person do
  context 'when a person is created' do

    before(:all) do
      @person = Person.create(
        id: 13,
        name: 'test human',
        pronouns: 'they, them',
      )
    end

    it 'checks that a person can be created' do
      expect(@person).to be_valid
    end

    it 'checks person created is not associated with a tag' do
      expect(@person.tags).to be_empty
    end

    it 'checks that a person can be read' do
      expect(Person.find_by_name("test human")).to eq(@person)
    end

    it 'checks that a person can be updated' do
      @person.update(:name => "Sir Test Human The Bold")
      expect(Person.find_by_name("Sir Test Human The Bold")).to eq(@person)
    end

    it 'checks that a person can be deleted' do
      @person.destroy
      expect(Person.find_by_name("test human")).to eq(nil)
    end

    after(:all) do
      @person.destroy
    end
  end
end
