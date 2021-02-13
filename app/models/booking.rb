class Booking < ApplicationRecord
  belongs_to :suit
  belongs_to :user

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date
  validates :status, presence: true, inclusion: { in: %w[Ordered Approved Shipped Delivered] }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end    

  def end_date_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "can't be in the past")
    end
  end    
end
