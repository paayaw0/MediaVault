class Bucket < ApplicationRecord
  belongs_to :data_hub
  has_many :data_objects, dependent: :destroy
end
