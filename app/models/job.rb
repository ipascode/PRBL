class Job < ApplicationRecord
  belongs_to :mechanic, foreign_key: :mechanic_id
  belongs_to :repair
  has_many :job_parts, dependent: :destroy
  accepts_nested_attributes_for :job_parts, reject_if: :all_blank, allow_destroy: true

  scope :done, lambda { where(status: "Done") }

end
