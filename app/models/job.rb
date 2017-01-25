class Job < ApplicationRecord
  belongs_to :mechanic
  belongs_to :repair
end
