class Blog < ActiveRecord::Base
  # attr_accessible :title, :content
  has_many :comments
  
  
  validates_presence_of :title
  validates_length_of :title, :within => 3..20, :on => :create
  
  def cap_it
    title.capitalize
  end
end
