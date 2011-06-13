module ActiveRecord
  module Acts
    module Gradable
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      
      module ClassMethods
        def acts_as_rateable(options = {})
          has_many :grades, :as => :gradable
        end
      end
      
      
    end
  end
end


ActiveRecord::Base.send(:include, ActiveRecord::Acts::Gradable) if defined?(ActiveRecord::Base)