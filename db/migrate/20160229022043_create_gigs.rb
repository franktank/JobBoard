class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.text :description
      t.integer :budget
      t.string :location
      t.boolean :open, default: true
      t.integer :awarded_proposal
      t.timestamps null: false
    end
  end
end
