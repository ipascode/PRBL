class BusModel < ApplicationRecord
	has_many :Buses, dependent: :destroy

end
