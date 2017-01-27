class BusModel < ApplicationRecord
	has_many :Buses, dependent: :destroy
    has_many :parts
end
