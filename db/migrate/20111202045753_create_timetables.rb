class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|

      t.timestamps
    end
  end
end
