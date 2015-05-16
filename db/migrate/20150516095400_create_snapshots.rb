class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.string :statusCode
      t.string :statusText
      t.text :data
      t.references :page, index: true
      t.timestamps null: false
    end
  end
end
