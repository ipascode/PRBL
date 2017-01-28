class Job < ApplicationRecord
  belongs_to :mechanic, foreign_key: :mechanic_id
  belongs_to :repair, foreign_key: :repair_id
  has_many :job_parts
  accepts_nested_attributes_for :job_parts, reject_if: :all_blank, allow_destroy: true
end
