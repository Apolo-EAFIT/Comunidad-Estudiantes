class Subject < ActiveRecord::Base
  acts_as_commentable
  
  has_and_belongs_to_many :teachers
  
  has_many :grades, :as => :gradable
  
  validates :code, :name, :presence => true
  validates :code, :uniqueness => true
  validates :credits, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true } 
  
  def score
    grades.map(&:score).sum
  end
  
  
end
