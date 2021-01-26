require 'rails_helper'

describe Tag do
  context 'when a tag is created' do

    before(:all) do
      @tag = Tag.create(
        id: 13,
        name: 'test tag',
      )
    end

    it 'checks that a tag can be created' do
      expect(@tag).to be_valid
    end

    it 'checks that a tag can be read' do
      expect(Tag.find_by_name("test tag")).to eq(@tag)
    end

    it 'checks that a tag can be updated' do
      @tag.update(:name => "Snow Days")
      expect(Tag.find_by_name("Snow Days")).to eq(@tag)
    end

    it 'checks that a tag can be deleted' do
      @tag.destroy
      expect(Tag.find_by_name("test tag")).to eq(nil)
    end

    after(:all) do
      @tag.destroy
    end
  end
end
