class Comment < ActiveRecord::Base
  # attr_accessible :blog, :first_name, :last_name, :message
  
  belongs_to :blog
  
end
