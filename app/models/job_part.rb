class JobPart < ApplicationRecord
  belongs_to :part, :touch => true
  belongs_to :job

end
