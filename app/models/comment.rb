class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :user, :inverse_of => :comments_as_author, :foreign_key => 'user_id', :class_name => "User"
  belongs_to :recipient, :class_name => "User", :foreign_key => "recipient_id"
  
  validates_presence_of :comment
  validates_presence_of :commentable_id, :commentable_type
  validates_length_of :comment, :maximum => 2000
  
  before_save :whitelist_attributes
  
  validates_presence_of :user, :unless => Proc.new{|record| configatron.allow_anonymous_commenting }
  validates_presence_of :author_email, :unless => Proc.new{|record| record.user } #require email unless logged in
  validates_format_of :author_url, :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :unless => Proc.new{|record| record.user }
    
  def commentable_name
    type = self.commentable_type.underscore
    case type
      when 'user'
        commentable.login
      when 'post'
        commentable.title
      when 'clipping'
        commentable.description || "Clipping from #{commentable.user.login}"
      else
        commentable.class.to_s.humanize
    end
  end
  
  def title_for_rss
    "Comment from #{username}"
  end
  
  def username
    user ? user.login : (author_name.blank? ? 'Anonymous' : author_name)
  end
  
end

