class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.text :name
      t.text :person
      t.text :location
      t.text :notes
      t.string :quest_type
      t.boolean :done, :default => false
      t.boolean :have, :default => false

      t.timestamps null: false
    end
  end
end
