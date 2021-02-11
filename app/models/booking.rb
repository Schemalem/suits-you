class Booking < ApplicationRecord
  belongs_to :suit
  belongs_to :user

  validates :status, presence: true, inclusion: { in: %w[ordered approved shipped delivered] }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
