class Grade < ActiveRecord::Base
  validates :score, :gradable_type, :gradable_id, :user_id, :presence => true
  
  belongs_to :gradable, :polymorphic => true
  
  scope :by_class,        lambda {|klass| where(:gradable_type => klass) }
  scope :by_score,        lambda {|grade| where(:score => grade)}
  scope :class_and_score, lambda {|klass, grade| by_class(klass).by_score(grade)}
  
end
