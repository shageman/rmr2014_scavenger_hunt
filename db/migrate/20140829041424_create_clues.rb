class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
