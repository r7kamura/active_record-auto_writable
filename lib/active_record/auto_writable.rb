# frozen_string_literal: true

require_relative 'auto_writable/version'

module ActiveRecord
  module AutoWritable
    autoload :Base, 'active_record/auto_writable/base'
    autoload :Relation, 'active_record/auto_writable/relation'
  end
end

require 'active_support'

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.extend ActiveRecord::AutoWritable::Base
  ActiveRecord::Relation.prepend ActiveRecord::AutoWritable::Relation
end
