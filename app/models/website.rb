class Website < ApplicationRecord
  belongs_to :user
  validates :url, url: true
  has_many :stats, dependent: :delete_all
end