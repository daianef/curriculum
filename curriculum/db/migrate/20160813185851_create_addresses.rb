class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :complement
      t.string :city
      t.string :state
      t.integer :number

      t.timestamps null: false
    end
  end
end
