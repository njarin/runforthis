class Resource < ApplicationRecord
  has_and_belongs_to_many :state_districts
end
