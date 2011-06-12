class Teacher < ActiveRecord::Base
  
  has_and_belongs_to_many :subjects
  
  validates :first_name, :last_name, :presence => true
  
end
