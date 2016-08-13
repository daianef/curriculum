class AddCadidateIdToLanguages < ActiveRecord::Migration
  def change
    add_reference :languages, :candidate, index: true, foreign_key: true
  end
end
