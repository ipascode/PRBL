class Repair < ApplicationRecord
	has_many :jobs
	belongs_to :Driver
	belongs_to :Bus
  	accepts_nested_attributes_for :jobs, reject_if: :all_blank, allow_destroy: true
end
