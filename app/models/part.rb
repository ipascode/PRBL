class Part < ApplicationRecord
  belongs_to :BusModel, optional: true
end
