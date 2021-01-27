class AddPrimaryKeyAndRankToPeopleTags < ActiveRecord::Migration[6.0]
  def change
    rename_table 'people_tags', 'person_tags'
    add_column :person_tags, :id, :primary_key
    add_column :person_tags, :rank, :integer, default: 0
  end
end
