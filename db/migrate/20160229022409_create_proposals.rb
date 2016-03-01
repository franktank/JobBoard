class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :bid
      t.text :description
      t.timestamps null: false
    end
  end
end
