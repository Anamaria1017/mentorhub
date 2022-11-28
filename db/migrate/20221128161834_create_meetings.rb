class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.date :date
      t.time :time
      t.string :subject
      t.string :location
      t.integer :status, default: 0
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
