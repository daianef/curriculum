class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :category

      t.timestamps null: false
    end
  end
end
