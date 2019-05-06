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

# Seed Data
customers = [
  {name: 'zabir', activated_on: '01/01/2019', deactivated_on: nil},
  {name: 'munira', activated_on: '01/01/2019', deactivated_on: '04/30/2019'},
  {name: 'zeenat', activated_on: '01/01/2019', deactivated_on: nil},
  {name: 'jesmnina', activated_on: '01/01/2019', deactivated_on: nil},
  {name: 'abul', activated_on: '01/01/2019', deactivated_on: '03/30/2019'},
]
subscription_plans = [{name: 'basic', price: 5}, {name: 'premium', price: 10s}]
subscriptions = [
  {customer_id: 1, subscription_plan_id: 2, started_on: '01/01/2019', ended_on: nil},
  {customer_id: 2, subscription_plan_id: 1, started_on: '01/01/2019', ended_on: '04/30/2019'},
  {customer_id: 3, subscription_plan_id: 2, started_on: '01/01/2019', ended_on: nil},
  {customer_id: 4, subscription_plan_id: 1, started_on: '01/01/2019', ended_on: nil},
  {customer_id: 5, subscription_plan_id: 1, started_on: '01/01/2019', ended_on: '03/30/2019'},
]

customer.each do |i| 
  Customer.create!(
    name: i[:name], 
    activated_on: i[:activated_on], 
    deactivated_on: i[:deactivated_on]
  )
end
subscription_plans.each {|i| SubscriptionPlan.create!(name: i[:name], price: i[:price])}
subscriptions.each do |i| 
  Subscription.create!(
    customer_id: i[:customer_id], 
    subscription_plan_id: i[:subscription_plan_id],
    started_on: i[:started_on],
    ended_on: i[:ended_on]
  )
end








