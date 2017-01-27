class Part < ApplicationRecord
  belongs_to :bus_model, optional: true
end
