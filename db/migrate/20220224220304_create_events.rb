class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    #Events Table
    create_table :events do |t|
      t.belongs_to :user

      t.string :title
      t.string :location
      t.text :description
      t.string :start_year
      t.string :start_month
      t.string :start_day
      # t.string :start_hour
      t.string :end_year
      t.string :end_month
      t.string :end_day
      # t.string :end_hour

      t.timestamps
    end
  end
end
