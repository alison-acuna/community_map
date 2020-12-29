class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.text :name
      t.text :pronouns
      
      t.timestamps
    end
  end
end
