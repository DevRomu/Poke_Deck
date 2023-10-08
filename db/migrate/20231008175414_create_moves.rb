class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.string :move_name
      t.integer :power
      t.integer :accuracy

      t.timestamps
    end
  end
end
