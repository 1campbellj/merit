class Graduation < ApplicationRecord
  belongs_to :user
  belongs_to :degree

  validates :user, presence: true
  validates :year, 
            numericality: { 
                            only_integer: true,
                            greater_than: 1900,
                            less_than_or_equal_to: Time.now.year
                          }
end
