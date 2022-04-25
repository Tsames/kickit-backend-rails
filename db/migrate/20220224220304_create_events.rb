class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    #Events Table
    create_table :events do |t|
      # t.belongs_to :user

      t.string :title
      t.string :location
      t.text :description
      t.string :cost
      t.integer :early
      t.integer :late
      t.text :days

      t.timestamps
    end
  end
end
