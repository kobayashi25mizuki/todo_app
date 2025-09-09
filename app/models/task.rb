class Task < ApplicationRecord

  def self.search_for(content)
   Task.where('title LIKE ?', '%' + content + '%')
  end

  scope :completed, -> { where(done: true) }
  scope :incomplete, -> { where(done: false) }
end
