class ARPost < ActiveRecord::Base
  self.table_name = 'posts'
  validates_presence_of :title
end
