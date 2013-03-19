require 'mongoid-audit/version'
require 'easy_diff'

module Mongoid
  module Audit
    mattr_accessor :tracker_class_name
    mattr_accessor :trackable_class_options
    mattr_accessor :modifier_class_name
    mattr_accessor :current_user_method

    def self.tracker_class
      @tracker_class ||= tracker_class_name.to_s.classify.constantize
    end
  end
end

require 'mongoid-audit/tracker'
require 'mongoid-audit/trackable'
require 'mongoid-audit/sweeper'

Mongoid::Audit.modifier_class_name = "User"
Mongoid::Audit.trackable_class_options = {}
Mongoid::Audit.current_user_method ||= :current_user
