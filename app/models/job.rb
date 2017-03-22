class Job < ApplicationRecord
  has_and_belongs_to_many :mechanics
  belongs_to :repair
  has_many :job_parts, dependent: :destroy
  accepts_nested_attributes_for :job_parts, reject_if: :all_blank, allow_destroy: true

  scope :done, lambda { where(status: "Done") }
  scope :datefilter, (lambda do |start_date, end_date|
	  Job.where("timefinished >= ? AND timefinished <= ?", 
	  start_date, end_date.end_of_day)
	end)
  validates :jobparticular, :status, presence: true

end
