class Bus < ApplicationRecord
  belongs_to :BusModel
  belongs_to :Repair
  belongs_to :BusLine
end
