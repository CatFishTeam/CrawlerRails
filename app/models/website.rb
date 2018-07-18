class Website < ApplicationRecord
  belongs_to :user
  validates :url, url: true
  has_many :stats
end