class AddCadidateIdToPhones < ActiveRecord::Migration
  def change
    add_reference :phones, :candidate, index: true, foreign_key: true
  end
end
