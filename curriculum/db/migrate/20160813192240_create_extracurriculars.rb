class CreateExtracurriculars < ActiveRecord::Migration
  def change
    create_table :extracurriculars do |t|
      t.string :title
      t.string :location
      t.string :date
      t.string :description
      t.string :workload

      t.timestamps null: false
    end
  end
end
