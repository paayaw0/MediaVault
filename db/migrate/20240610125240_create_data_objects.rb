class CreateDataObjects < ActiveRecord::Migration[8.0]
  def change
    create_table :data_objects do |t|
      t.string :name
      t.text :description
      t.references :data_hub, null: false, foreign_key: true
      t.references :bucket, null: false, foreign_key: true
      t.boolean :private, default: false, null: false
      t.integer :size, default: 0, null: false
      t.datetime :last_accessed_at
      t.string :tags, array: true, default: []
      t.string :checksum, null: false
      t.string :object_type

      t.timestamps
    end
  end
end
