class DevicesController < ApplicationController
  def register
    respond_to do |format|
      if Device.register(device_params)
        format.json { render json: { result: true }, status: :ok }
      else
        format.json { render json: { result: false }, status: :unprocessable_entity }
      end
    end
  end

  private
    def device_params
      params.permit(:user_id, :platform_application_arn, :token)
    end
end
