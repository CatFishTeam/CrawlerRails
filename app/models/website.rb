class Website < ApplicationRecord
  add_column :url, :user_id
  belongs_to :user
end