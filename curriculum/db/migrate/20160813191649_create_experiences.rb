class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :designation
      t.string :start_date
      t.string :end_date
      t.string :description

      t.timestamps null: false
    end
  end
end
