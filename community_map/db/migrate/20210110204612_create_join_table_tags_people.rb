class CreateJoinTableTagsPeople < ActiveRecord::Migration[5.1]
  def change
    create_join_table :people, :tags do |t|
      t.index [:person_id, :tag_id]
      t.index [:tag_id, :person_id]
    end
  end
end
