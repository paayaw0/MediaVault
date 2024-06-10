class CreateDataHubs < ActiveRecord::Migration[8.0]
  def change
    create_table :data_hubs do |t|
      t.string :drive_id, null: false
      t.integer :storage_quota, default: 15, null: false
      t.integer :used_storage, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.integer :plan_type, default: 0, null: false
      t.string :region
      t.integer :backup_status
      t.integer :owner_id, null: false

      t.timestamps
    end
  end
end
