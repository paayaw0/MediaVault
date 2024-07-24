class FileUploadsController < ApplicationController
  before_action :set_data_hub
  before_action :set_data_object, only: [:show, :edit, :update, :destroy, :rename]

  def index
    @data_objects = @data_hub.data_objects
  end

  def show
  end

  def new
    @data_object = @data_hub.data_objects.new
  end

  def create
    @data_object = @data_hub.data_objects.new(file_upload_params)

    if @data_object.save
      redirect_to root_path, notice: 'File uploaded successfully'
    else
      flash.now[:alert] = 'Oops! Something went wrong. File failed to upload'
      render :new
    end
  end

  def edit
  end

  def rename
  end

  def update
    if @data_object.update(file_upload_params)
      redirect_to root_path, notice: 'File uploaded successfully'
    else
      flash.now[:alert] = 'Oops! Something went wrong. File failed to upload'
      render :edit
    end
  end

  def destroy
    @data_object.destroy
    redirect_to root_path, notice: 'File removed successfully'
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

  def set_data_hub
    # short cut for sessions
    return @data_hub = DataHub.first if params[:data_hub_id].blank?

    @data_hub = DataHub.find(params[:data_hub_id])
  end

  def set_data_object
    @data_object = @data_hub.data_objects.find(params[:id])
  end
end
