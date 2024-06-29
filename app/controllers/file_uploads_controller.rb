class FileUploadsController < ApplicationController
  before_action :set_data_object, only: [:show, :edit, :update, :destroy]

  def index
    @data_objects = DataObject.all
  end

  def show
  end

  def new
    @data_object = DataObject.new
  end

  def create
    @data_object = DataObject.new(file_upload_params)

    if @data_object.save
      redirect_to file_uploads_path, notice: 'File uploaded successfully'
    else
      flash.now[:alert] = 'Oops! Something went wrong. File failed to upload'
      render :new
    end
  end

  def edit
  end

  def update
    if @data_object.update(file_upload_params)
      redirect_to file_uploads_path, notice: 'File uploaded successfully'
    else
      flash.now[:alert] = 'Oops! Something went wrong. File failed to upload'
      render :edit
    end
  end

  def destroy
    @data_object.destroy
    redirect_to file_uploads_path, notice: 'File removed successfully'
  end


  private

  def file_upload_params
    params.require(:data_object).permit(
      :name,
      :file,
      :description,
      :data_hub_id,
      :bucket_id,
      :private,
      tags: []
    )
  end

  def set_data_object
    @data_object = DataObject.find(params[:id])
  end
end
