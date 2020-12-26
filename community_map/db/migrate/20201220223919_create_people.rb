class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :pronouns
      t.string :address
      t.string :fblink
      t.string :iglink
      t.string :lilink
      t.string :tags
      t.timestamps
    end
  end
end
