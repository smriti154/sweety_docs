class CreateGlucoseReadings < ActiveRecord::Migration
  def change
    create_table :glucose_readings do |t|
      t.date :observation_date
      t.integer :glucose_level
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
