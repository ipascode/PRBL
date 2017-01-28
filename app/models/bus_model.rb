class BusModel < ApplicationRecord
	has_many :buses, dependent: :destroy
    has_many :parts
end
