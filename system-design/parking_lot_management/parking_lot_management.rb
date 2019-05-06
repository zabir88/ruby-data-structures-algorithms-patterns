# Instead of loading all of Rails, load the
# particular Rails dependencies we need
require 'sqlite3'
require 'active_record'
require 'date'

# Set up a database that resides in RAM
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

# Set up database tables and columns
ActiveRecord::Schema.define do
  
  create_table :vehicles, force: true do |t|
    t.string :vehicle_no
  end
  
  create_table :passes, force: true do |t|
    t.float :cost
    t.string :category
    t.references :vehicle
  end
  
  create_table :parking_lots, force: true do |t|
    t.integer :floor
    t.integer :capacity
    t.boolean :is_accessible
  end
  
  create_table :slots, force: true do |t|
    t.integer :slot_no
    t.references :parking_lot
    t.references :reservation
  end 
  
  create_table :reservations, force: true do |t|
    t.datetime :started_on
    t.datetime :ended_on
    t.references :vehicle
  end
end

class Vehicle < ActiveRecord::Base
  # attr_accessor :vehicle
  has_one :pass
  has_one :reservation
  has_one :slot, through: :reservation
end

class Pass < ActiveRecord::Base
  # attr_accessor :cost, :category
  belongs_to :vehicle  
end

class ParkingLot < ActiveRecord::Base
  # attr_accessor :floor, :is_accessible
  has_many :slots  
end

class Slot < ActiveRecord::Base
  #attr_accessor :slot_no
  belongs_to :parking_lot
  belongs_to :reservation
end

class Reservation < ActiveRecord::Base
  #attr_accessor :started_on, :ended_on
  belongs_to :vehicle
  has_one :slot
end

# Seed Data
vehicles = ['honda', 'toyota', 'nisssan']
passes = [
  {cost: 20, category: 'daily', customer_id: 1},
  {cost: 2, category: 'hourly', customer_id: 2},
  {cost: 2, category: 'hourly', customer_id: 3},
]
parking_lots = [
  {floor: 1, is_accessible: true, capacity: 5}, 
  {floor: 2, is_accessible: true, capacity: 5}, 
  {floor: 3, is_accessible: false, capacity: 5} 
]

slots = [
  {slot_no: 1, parking_lot_id: 1, reservation_id: nil}, 
  {slot_no: 2, parking_lot_id: 1, reservation_id: nil}, 
  {slot_no: 3, parking_lot_id: 1, reservation_id: nil}, 
  {slot_no: 4, parking_lot_id: 1, reservation_id: nil}, 
  {slot_no: 5, parking_lot_id: 1, reservation_id: nil}, 
  {slot_no: 1, parking_lot_id: 2, reservation_id: nil}, 
  {slot_no: 2, parking_lot_id: 2, reservation_id: nil}, 
  {slot_no: 3, parking_lot_id: 2, reservation_id: nil}, 
  {slot_no: 4, parking_lot_id: 2, reservation_id: nil}, 
  {slot_no: 5, parking_lot_id: 2, reservation_id: nil}, 
  {slot_no: 1, parking_lot_id: 3, reservation_id: nil}, 
  {slot_no: 2, parking_lot_id: 3, reservation_id: nil}, 
  {slot_no: 3, parking_lot_id: 3, reservation_id: nil}, 
  {slot_no: 4, parking_lot_id: 3, reservation_id: nil}, 
  {slot_no: 5, parking_lot_id: 3, reservation_id: nil} 
] 
vehicles.each {|i| Vehicle.create!(vehicle_no: i)}
passes.each {|i| Pass.create!(cost: i[:cost], category: i[:category], vehicle_id: i[:customer_id])}
parking_lots.each {|i| ParkingLot.create!(floor: i[:floor], capacity: i[:capacity], is_accessible: i[:is_accessible])}
slots.each {|i| Slot.create!(slot_no: i[:slot_no], parking_lot_id: i[:parking_lot_id], reservation_id: i[:reservation_id])}


