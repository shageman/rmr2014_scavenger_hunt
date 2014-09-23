class AddClueOrder < ActiveRecord::Migration
  def change
    add_column :teams, :clue_order, :string
    add_column :teams, :current_clue_index, :integer
  end
end
