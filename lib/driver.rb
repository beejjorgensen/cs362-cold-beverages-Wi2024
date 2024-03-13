#! /usr/bin/env ruby
require_relative 'chiller'
require_relative 'freezer'
require_relative 'item'
require_relative 'refrigerator'
require_relative 'vessel'
require_relative 'water_dispenser'
require_relative 'water_reservoir'

chiller = Chiller.new
freezer = Freezer.new
water_reservoir = WaterReservoir.new
water_dispenser = WaterDispenser.new(water_reservoir)

refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

puts refrigerator

refrigerator.plug_in

refrigerator.set_chiller_level(5)
refrigerator.set_freezer_level(5)

pizza = Item.new('Leftover Pizza', 5)
refrigerator.chill(pizza)

dreamsicle = Item.new('Dreamsicle', 1)
refrigerator.freeze(dreamsicle)

nalgene = Vessel.new('Nalgene', 2)
water_dispenser.dispense(nalgene)

puts refrigerator

refrigerator.unplug
