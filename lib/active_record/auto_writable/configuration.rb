# frozen_string_literal: true

module ActiveRecord
  module AutoWritable
    class Configuration
      attr_writer :proxy

      # @return [Proc]
      def proxy
        @proxy ||= lambda do |&block|
          ::ActiveRecord::Base.connected_to(role: :writing, &block)
        end
      end
    end
  end
end
