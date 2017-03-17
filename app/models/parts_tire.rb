class PartsTire < ApplicationRecord
  belongs_to :part,  inverse_of: :parts_tire, dependent: :destroy
  belongs_to :bus, optional: true


    validates :serial_no, :odometer, :presence => true
  	validates :serial_no, uniqueness: { case_sensitive: false}
end
