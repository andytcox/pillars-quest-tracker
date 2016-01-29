class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.text :name
      t.text :person
      t.text :location
      t.text :notes

      t.timestamps null: false
    end
  end
end
