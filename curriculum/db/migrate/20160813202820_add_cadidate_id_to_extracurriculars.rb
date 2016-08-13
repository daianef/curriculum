class AddCadidateIdToExtracurriculars < ActiveRecord::Migration
  def change
    add_reference :extracurriculars, :candidate, index: true, foreign_key: true
  end
end
