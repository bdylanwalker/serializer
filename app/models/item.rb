class Item < ActiveRecord::Base
  validates_uniqueness_of :url

  before_save :truncate_title
  def truncate_title
    self.title = self.title[0..140] + '...' if self.title.length > 140
  end

  def self.default
    where(source: ['hacker_news', 'reddit', 'product_hunt']).order(created_at: 'DESC')
  end
end
