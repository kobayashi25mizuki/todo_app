class Task < ApplicationRecord
  def self.search_for(content)
   Task.where('title LIKE ?', '%' + content + '%')
  end
end
