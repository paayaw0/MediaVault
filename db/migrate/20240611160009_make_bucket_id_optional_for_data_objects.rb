class MakeBucketIdOptionalForDataObjects < ActiveRecord::Migration[8.0]
  def change
    change_column_null :data_objects, :bucket_id, true
  end
end
