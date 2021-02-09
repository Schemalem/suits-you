class Suit < ApplicationRecord
 belongs_to :user
 has_many :bookings, dependent: :destroy

 validates :size, presence: true
 validates :colour, presence: true
 validates :style, presence: true
 validates :occasion, presence: true, inclusion: { in: %w(interview funeral wedding party date) }
 validates :price, presence: true
 validates :brand, presence: true
end