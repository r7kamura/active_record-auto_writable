# frozen_string_literal: true

require_relative 'auto_writable/version'

module ActiveRecord
  module AutoWritable
    autoload :Base, 'active_record/auto_writable/base'
    autoload :Configuration, 'active_record/auto_writable/configuration'
    autoload :Relation, 'active_record/auto_writable/relation'

    class << self
      # @return [ActiveRecord::AutoWritable::Configuration]
      def configuration
        @configuration ||= Configuration.new
      end
    end
  end
end

require 'active_support'

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.extend ActiveRecord::AutoWritable::Base
  ActiveRecord::Relation.prepend ActiveRecord::AutoWritable::Relation
end
