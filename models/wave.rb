class Wave < ActiveRecord::Base

    default_scope { where(successful: true) }

end