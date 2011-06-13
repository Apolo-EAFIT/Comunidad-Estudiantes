class Subject < ActiveRecord::Base
  
  has_and_belongs_to_many :teachers
  
  after_initialize :set_defaults
  
  validates :code, :name, :presence => true
  validates :code, :uniqueness => true
  validates :credits, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true } 
  
  def set_defaults
    self.credits ||= 0
  end
  
end
