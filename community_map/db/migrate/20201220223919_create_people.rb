class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.text :name
      t.text :pronouns
      t.text :address
      t.text :fblink
      t.text :iglink
      t.text :lilink
      t.text :tags
      t.timestamps
    end
  end
end
