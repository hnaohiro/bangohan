class User < ActiveRecord::Base
  def self.reset
    all.each do |user|
      user.update_attributes({
        hour: 0,
        min: 0,
        need: true,
        defined: false
      })
    end
  end
end
