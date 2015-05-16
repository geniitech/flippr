class CreateSnapshotData < ActiveRecord::Migration
  def change
    create_table :snapshot_data do |t|
      t.references :snapshot, index: true
      t.text :data
      t.string :statusCode
      t.string :statusText
      t.timestamps null: false
    end
  end
end
