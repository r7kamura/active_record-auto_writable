class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  connects_to(
    database: {
      reading: :primary_replica,
      writing: :primary
    }
  )
end
