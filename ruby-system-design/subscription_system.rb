require 'date'

class Customer
  attr_accessor :id, :name, :user_id, :activated_on, :deactivated_on
  has_many :subscriptions
  has_many :subscription_plans, through :subscriptions
  belongs_to :user
end

class User
  attr_accessor :id, :name  
  has_many :customers 
end

class Subscription
  attr_accessor :id, :customer_id, :subscription_plan_id, :started_on, :ended_on
  belongs_to :customer
  belongs_to :subscription_plan
end

class SubscriptionPlan
  attr_accessor :id, :name, :price
  has_many :subscriptions
  has_many :customers, through :subscriptions 
end

module Billing
  def self.monthly_grand_total(price, user_arr, month='2019-01')
    date = {year: month[0..3].to_i, month: month[5..6].to_i}
    start_date_of_month = Date.new(date[:year], date[:month]).day
    end_date_of_month = Date.new(date[:year], date[:month], -start_date_of_month).day
    charge_per_customer_per_month = price
    total_days_for_current_month = end_date_of_month - start_date_of_month
    grand_total = 0
    for i in start_date_of_month..end_date_of_month
      today_date = Date.new(date[:year], date[:month], i)
      acitve_user = user_arr.select{|i| i[:deactivated_on] != nil && i[:deactivated_on] > today_date} 
      grand_total = grand_total + (acitve_user.lenghth * (charge_per_customer_per_month / total_days_for_current_month))
    end
    grand_total.round(2)
  end
end