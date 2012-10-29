class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
