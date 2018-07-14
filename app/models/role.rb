class Role < ApplicationRecord
  validates_uniqueness_of :role_name
  has_many :users

end
