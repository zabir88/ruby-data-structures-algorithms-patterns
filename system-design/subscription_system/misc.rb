require 'date'
require './subscription_system'
# module Misc
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








