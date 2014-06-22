class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :allow_cross_domain_access

  def allow_cross_domain_access
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'Etag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*, x-requested-with, Content-Type, If-Modified-Since, If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end

  def notify(sender_user_id, message)
    sns = AWS::SNS.new.client

    devices = Device.where.not(user_id: sender_user_id)
    devices.each do |device|
      begin
        response = sns.create_platform_endpoint(
          platform_application_arn: device.platform_application_arn,
          token: device.token
        )

        sns.publish(
          target_arn: response[:endpoint_arn],
          message: message
        )
      rescue => e
      end
    end
  end
end
