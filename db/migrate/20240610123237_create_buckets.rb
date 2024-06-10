class CreateBuckets < ActiveRecord::Migration[8.0]
  def change
    create_table :buckets do |t|
      t.string :name, null: false
      t.text :description
      t.references :data_hub, null: false, foreign_key: true
      t.integer :parent_bucket_id, null: true
      t.boolean :private, default: false, null: false
      t.integer :size, default: 0
      t.integer :data_object_count, default: 0
      t.datetime :last_accessed_at
      t.string :tags, array: true, default: []
      t.uuid :unique_identifier, null: false

      t.timestamps
    end
  end
end
