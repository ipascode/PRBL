class Repair < ApplicationRecord
	 has_many :jobs
  accepts_nested_attributes_for :jobs, reject_if: :all_blank, allow_destroy: true
end
