class AddCadidateIdToEducations < ActiveRecord::Migration
  def change
    add_reference :educations, :candidate, index: true, foreign_key: true
  end
end
