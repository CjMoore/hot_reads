class HotRead < ActiveRecord::Base

  validates :url, presence: true

  def self.get_recent
    where('updated_at >= ?', 1.day.ago).order('count DESC').limit(10)
  end
end
