class User < ActiveRecord::Base
  validates :hour, numericality: true
  validates :min, numericality: true

  def self.reset
    all.each do |user|
      user.update_attributes(
        hour: 0,
        min: 0,
        need: true,
        defined: false
      )
    end
  end

  def to_msg
    unless self.defined
      "#{self.name}が未定に変更しました。"
    else
      if self.need
        hour = sprintf('%0d2', self.hour)
        min = sprintf('%02d', self.min)
        "#{self.name}は#{hour}:#{min}に晩ご飯をたべます。"
      else
        "#{self.name}は今日はいりません。"
      end
    end
  end
end
