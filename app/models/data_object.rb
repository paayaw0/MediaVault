class DataObject < ApplicationRecord
  PERMITTED_FILE_TYPES = [
    'application/pdf',
    'application/msword',
    'application/vnd.ms-excel',
    'application/vnd.ms-powerpoint',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'video/mp4',
    'video/mpeg',
    'video/ogg',
    'video/webm',
    'video/x-msvideo',
    'audio/mpeg',
    'audio/png',
    'audio/wave',
    'audio/aac',
    'audio/midi',
    'image/jpeg',
    'image/png',
    'image/gif',
    'image/svg+xml',
    'image/tiff',
    'text/plain',
    'text/css',
    'text/csv',
    'text/xml'
  ]

  belongs_to :data_hub
  belongs_to :bucket, optional: true
  has_one_attached :file

  validates :file, file_format: true

  before_validation do |data_object|
    data_object.name = file.filename if data_object.name.nil?
    data_object.checksum = file.blob.checksum
    data_object.object_type = file.blob.content_type
  end
end
