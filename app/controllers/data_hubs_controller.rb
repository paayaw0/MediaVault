class DataHubsController < ApplicationController
  before_action :set_data_hub, only: %i[show edit update destroy]

  def index
    @data_hubs = DataHub.all
  end

  def show
  end

  def edit
  end

  def new
    @data_hub = DataHub.new
  end

  def create
    @data_hub = DataHub.new(data_hub_params)

    if @data_hub.save
      redirect_to @data_hub, notice: 'DataHub successfully created'
    else
      render :new
    end
  end

  def update
    if @data_hub.update(data_hub_params)
      redirect_to root_path, notice: 'DataHub successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @data_hub.destroy

    redirect_to root_path, notice: 'DataHub and all assciated data successfully deleted'
  end


  private


  def set_data_hub
    @data_hub = DataHub.find(params[:id])
  end

  def data_hub_params
    params.require(:data_hub).permit(
      :plan_type,
      :region
    )
  end
end
