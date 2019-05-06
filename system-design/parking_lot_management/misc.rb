require './parking_lot_management'

module Misc
  
  def self.make_reservation(vehicle_no)
    # Check if slot available
    return nil if Slot.count > ParkingLot.sum("capacity")
    # If slot available
    vehicle = get_vehicle(vehicle_no)
    new_reservation = Reservation.create!(started_on: Time.now, ended_on: nil, vehicle_id: vehicle.id)
    Slot.where(reservation_id: nil).first.update(reservation_id: new_reservation.id)
  end
  
  def self.find_vehicle(vehicle_no)
    vehicle_slot = Vehicle.find_by(vehicle_no: vehicle_no).slot
    floor = vehicle_slot.parking_lot.floor
    {floor: floor, slot: vehicle_slot.slot_no}
  end

  def self.vehicle_pass_category (vehicle_no)
    Vehicle.find_by(vehicle_no: vehicle_no).pass.category
  end

  def self.parking_lot_floor_status(floor)
    slots_taken = Slot.joins(:parking_lot).where(parking_lots: {floor: floor}).size
    slots_taken >= ParkingLot.where(floor: floor).first.capacity ? "CLOSED" : "OPEN"
  end

  def self.get_vehicle_bill(vehicle_no)
    vehicle = get_vehicle(vehicle_no)
  end

  private

  def self.get_vehicle(vehicle_no)
    Vehicle.find_by(vehicle_no: vehicle_no)
  end

end
# Misc.make_reservation('honda')
# Misc.make_reservation('toyota')
p ParkingLot.includes(:slots).explain
puts 'zabir'
p ParkingLot.joins(:slots).explain



