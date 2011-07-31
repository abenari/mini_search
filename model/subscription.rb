
class Subscription < ActiveRecord::Base
  set_table_name 'cp_pool'
  belongs_to :organization, :foreign_key => :owner_id
  scoped_search :on => :productname, :complete_value => true, :rename => :product
  scoped_search :on => :activesubscription, :complete_value => {:true => true, :false => false}, :rename => :active
  scoped_search :on => :quantity, :complete_value => true
  scoped_search :on => :contractnumber, :complete_value => true, :rename => :contract
  scoped_search :on => :enddate, :complete_value => true, :rename => :expire
  scoped_search :on => :startdate, :complete_value => true, :rename => :begin
  scoped_search :in => :organization, :on => :displayname, :complete_value => true, :rename => :org

  scope :my_subscription, lambda { |owner|
    where("cp_pool.owner_id = ?", owner)
  }
end
