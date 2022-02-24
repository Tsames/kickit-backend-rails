class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    #Availabilities Table
    create_table :availabilities do |t|
      t.belongs_to :event

      t.string :name
      t.text :days, array: true, default: []

      t.timestamps
    end
  end
end
