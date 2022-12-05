class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.boolean :liked, default: false
      t.references :profile, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
