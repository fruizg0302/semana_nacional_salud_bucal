class Jurisdiction < ActiveRecord::Base
  has_many :users
  belongs_to :state
end
