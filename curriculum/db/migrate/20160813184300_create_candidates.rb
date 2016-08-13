class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :homepage
      t.string :github
      t.string :linkedin
      t.string :goal

      t.timestamps null: false
    end
  end
end
