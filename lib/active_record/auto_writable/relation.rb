# frozen_string_literal: true

module ActiveRecord
  module AutoWritable
    module Relation
      METHOD_NAMES = %i[
        delete_all
        delete_by
        update_all
      ].freeze

      METHOD_NAMES.each do |method_name|
        define_method(method_name) do |*args, **kwargs, &block|
          ::ActiveRecord::Base.connected_to(role: :writing) do
            super(*args, **kwargs, &block)
          end
        end
      end
    end
  end
end
