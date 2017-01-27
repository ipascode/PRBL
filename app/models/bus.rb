class Bus < ApplicationRecord
  belongs_to :BusModel
  has_many :repairs
  belongs_to :BusLine
end
