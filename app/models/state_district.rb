class StateDistrict < ApplicationRecord
  has_many :state_legislators
  has_and_belongs_to_many :resources
end
