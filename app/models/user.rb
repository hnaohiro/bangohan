class User < ActiveRecord::Base
  validates :hour, numericality: true
  validates :min, numericality: true

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
