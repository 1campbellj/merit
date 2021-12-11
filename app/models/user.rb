class User < ApplicationRecord

  enum status: [:goal, :contact, :education, :complete]
  has_one :goal
end
