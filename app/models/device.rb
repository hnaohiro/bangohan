class Device < ActiveRecord::Base
  def self.register(device_params)
    device = find_by token: device_params[:token]

    if device
      device.update_attributes device_params
    else
      create device_params
    end
  end
end
