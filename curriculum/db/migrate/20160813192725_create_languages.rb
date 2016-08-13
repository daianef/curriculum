class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :idiom
      t.string :reading
      t.string :writing
      t.string :conversation
      t.string :fluence

      t.timestamps null: false
    end
  end
end
