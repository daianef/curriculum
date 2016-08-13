class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :institute
      t.string :start_date
      t.string :end_date
      t.string :degree
      t.string :description

      t.timestamps null: false
    end
  end
end
