class Country < ApplicationRecord
  has_many :regions, :dependent => :destroy
  validates :name, presence: true, length: { minimum: 3 }
end
