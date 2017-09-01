class Organization < ActiveRecord::Base
  belongs_to :address
  has_many :websites
  has_many :associates


end
