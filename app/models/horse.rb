class Horse < ActiveRecord::Base
  validates :name, presence: true
end
