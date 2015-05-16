class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.string :title
      t.text :description
      t.integer :project_id

      t.timestamps null: false
    end
    add_index :pages, :project_id
  end
end
