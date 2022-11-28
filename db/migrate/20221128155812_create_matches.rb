class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.boolean :match, default: true
      t.integer :mentor_id
      t.integer :mentee_id

      t.timestamps
    end
  end
end
