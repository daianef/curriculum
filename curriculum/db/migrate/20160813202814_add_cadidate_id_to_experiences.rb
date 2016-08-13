class AddCadidateIdToExperiences < ActiveRecord::Migration
  def change
    add_reference :experiences, :candidate, index: true, foreign_key: true
  end
end
