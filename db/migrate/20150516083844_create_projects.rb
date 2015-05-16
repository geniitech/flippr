class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, index: true
      t.text :description
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
