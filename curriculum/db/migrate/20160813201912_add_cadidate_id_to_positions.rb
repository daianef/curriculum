class AddCadidateIdToPositions < ActiveRecord::Migration
  def change
    add_reference :positions, :candidate, index: true, foreign_key: true
  end
end
