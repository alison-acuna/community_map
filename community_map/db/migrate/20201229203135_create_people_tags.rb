class CreatePeopleTags < ActiveRecord::Migration[5.1]
  def change
    create_table :people_tags do |t|
      t.references :person, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
