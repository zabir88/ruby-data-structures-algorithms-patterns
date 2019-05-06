# Singleton Pattern
require 'singleton'
class AppConfig
  include Singleton
  attr_accessor :data
end

first = AppConfig.instance
second = AppConfig.instance
first.data =  {enabled: true}
puts first.data
second.data = {enabled: false}
puts first.data
