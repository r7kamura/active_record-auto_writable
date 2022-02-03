# frozen_string_literal: true

module ActiveRecord
  module AutoWritable
    module Base
      METHOD_NAMES = %i[
        _delete_record
        _insert_record
        _update_record
        insert_all
        insert_all!
        upsert_all
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
