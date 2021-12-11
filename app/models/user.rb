class User < ApplicationRecord
  enum status: {
    contact: 0, 
    education: 20,
    complete: 30
  }

  belongs_to :goal

  validates :first_name, :last_name, :email, :phone_number, presence: true, if: :contact_or_after?

  def contact_or_after?
    User.statuses[status] >= User.statuses[:contact]
  end

  def education_or_after?
    User.statuses[status] >= User.statuses[:education]
  end

  def complete?
    status == 'complete'
  end

end
