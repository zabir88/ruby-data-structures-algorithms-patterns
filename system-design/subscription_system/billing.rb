require 'date'
require './subscription_system'

# Seed Data
customer_1 = Customer.create!(name: 'zabir', activated_on: '01/01/2019', deactivated_on: nil)
customer_2 = Customer.create!(name: 'munira', activated_on: '01/01/2019', deactivated_on: nil)
customer_3 = Customer.create!(name: 'zeenat', activated_on: '01/01/2019', deactivated_on: '04/30/2019')
customer_4 = Customer.create!(name: 'jesmnina', activated_on: '01/01/2019', deactivated_on: nil)
sub_plan_1 = SubscriptionPlan.create!(name: 'basic', price: 5)
sub_plan_2 = SubscriptionPlan.create!(name: 'premium', price: 10)
subs_1 = Subscription.create!(customer_id: 1, subscription_plan_id: 2, started_on: '01/01/2019', ended_on: nil) 
subs_2 = Subscription.create!(customer_id: 2, subscription_plan_id: 1, started_on: '01/01/2019', ended_on: nil) 
subs_3 = Subscription.create!(customer_id: 3, subscription_plan_id: 1, started_on: '01/01/2019', ended_on: '04/30/2019') 
subs_4 = Subscription.create!(customer_id: 4, subscription_plan_id: 1, started_on: '01/01/2019', ended_on: nil)

# module Billing
#   def self.monthly_grand_total(price, user_arr, month='2019-01')
#     # find total for each day of the month for all active uers
#     # sum all total of each day of the current month to get the grand total of the month
    
#     date = {year: month[0..3].to_i, month: month[5..6].to_i}
#     start_date_of_month = Date.new(date[:year], date[:month]).day
#     end_date_of_month = Date.new(date[:year], date[:month], -start_date_of_month).day
#     charge_per_customer_per_month = price
#     total_days_for_current_month = end_date_of_month - start_date_of_month
#     grand_total = 0
#     for i in start_date_of_month..end_date_of_month
#       today_date = Date.new(date[:year], date[:month], i)
#       acitve_user = user_arr.select{|i| i[:deactivated_on] != nil && i[:deactivated_on] > today_date} 
#       grand_total = grand_total + (acitve_user.length * (charge_per_customer_per_month / total_days_for_current_month))
#     end
#     grand_total.round(2)
#   end
# end








