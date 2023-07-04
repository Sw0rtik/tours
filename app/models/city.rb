class City < ApplicationRecord
  has_many :holiday_houses, :dependent => :destroy
  belongs_to :region
end
