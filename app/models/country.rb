class Country < ApplicationRecord
  has_many :authors
  validates_uniqueness_of :name
  validates_presence_of :name
end
