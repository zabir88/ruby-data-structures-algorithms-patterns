# Instead of loading all of Rails, load the
# particular Rails dependencies we need
require 'sqlite3'
require 'active_record'

# Set up a database that resides in RAM
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :customers, force: true do |t|
    t.string :name
    t.date :activated_on
    t.date :deactivated_on
  end
  create_table :subscription_plans, force: true do |t|
    t.string :name
    t.float :price
  end
  create_table :subscriptions, force: true do |t|
    t.date :started_on
    t.date :ended_on
    t.references :customer
    t.references :subscription_plan
  end
end

class Customer < ActiveRecord::Base
  has_many :subscriptions
  has_many :subscription_plans, through: :subscriptions
end

class SubscriptionPlan < ActiveRecord::Base
  has_many :subscriptions
  has_many :customers, through: :subscriptions 
end

class Subscription < ActiveRecord::Base
  belongs_to :customer
  belongs_to :subscription_plan
end