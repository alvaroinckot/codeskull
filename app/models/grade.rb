class Grade < ActiveRecord::Base
  belongs_to :track
  belongs_to :user
end
