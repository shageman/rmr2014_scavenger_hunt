class AddClueType < ActiveRecord::Migration
  def change
    add_column :clues, :clue_type, :string
  end
end
