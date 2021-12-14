class User < ApplicationRecord
  enum status: {
    start: 0,
    contact: 5, 
    graduation: 10,
    complete: 15
  }

  # this is always validated to exist
  belongs_to :goal

  has_one :graduation
  has_one :degree, through: :graduation
  
  accepts_nested_attributes_for :graduation

  # validate contact information only after it's entered in the contact state
  validates :first_name, :last_name, :email, :phone_number, presence: true, if: :contact_or_after?
  validates :email, uniqueness: true, if: :contact_or_after?
  validates :phone_number, uniqueness: true, if: :contact_or_after?
  validate :email_format, if: :contact_or_after?
  validate :phone_format, if: :contact_or_after?

  # degree must exist if only after it's entered in the education state
  validates_associated :graduation, if: :graduation_or_after?

  def contact_or_after?
    User.statuses[status] > User.statuses[:contact]
  end

  def graduation_or_after?
    User.statuses[status] > User.statuses[:graduation]
  end

  def complete?
    status == 'complete'
  end

  def email_format
    if !email.match(/\A.+@.+\..+/)
      errors.add(:email, 'must be a valid email signature')
    end
  end

  def phone_format
    if phone_number.length != 10 || !phone_number.match(/\A\d+\z/)
      errors.add(:phone_number, 'must be 10 numbers and no other characters')
    end
  end

  def has_masters?
    return graduation.degree.name == "Master's Degree"
  end

  def has_bachelors?
    return graduation.degree.name == "Bachelor's Degree"
  end

end
