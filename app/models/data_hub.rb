class DataHub < ApplicationRecord
  MAX_STORAGE_QUOTA = 15

  enum :status, {
    active: 0,
    inactive: 1,
    suspended: 2
  }

  enum :plan_type, {
    free: 0,
    premium: 1,
    enterprise: 2,
    unlimited: 3,
    custom: 4,
  }

  has_many :buckets, dependent: :destroy
  has_many :data_objects, dependent: :destroy
end
