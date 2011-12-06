class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.time :departure
      t.time :arrival
      t.string :vehicle
      t.integer :timetable_id

      t.timestamps
    end
  end
end
