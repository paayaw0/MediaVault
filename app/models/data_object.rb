class DataObject < ApplicationRecord
  belongs_to :data_hub
  belongs_to :bucket
end
