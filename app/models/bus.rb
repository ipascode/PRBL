class Bus < ApplicationRecord
  belongs_to :bus_model
  has_many :repairs
  belongs_to :bus_line
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  before_destroy :no_referenced_repairs
end


