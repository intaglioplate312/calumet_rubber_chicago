class Website < ActiveRecord::Base
  has_many :website_items
  belongs_to :organization
end
