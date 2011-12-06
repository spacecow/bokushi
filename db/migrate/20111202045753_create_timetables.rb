class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :base
      t.string :destination

      t.timestamps
    end
  end
end
