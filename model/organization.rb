
class Organization < ActiveRecord::Base
  set_table_name 'cp_owner'
  has_many :subscription
end

