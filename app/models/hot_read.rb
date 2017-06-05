class HotRead < ActiveRecord::Base

  def self.get_recent
    where('updated_at >= ?', 1.day.ago).order('count DESC').limit(10)
  end
end
