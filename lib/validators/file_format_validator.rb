class FileFormatValidator < ActiveModel::Validator
  def validate(data_object)
    unless DataObject::PERMITTED_FILE_TYPES.include?(data_object.file.blob.content_type)
      data_object.errors.add(:base, 'file format not supported')
    end
  end
end