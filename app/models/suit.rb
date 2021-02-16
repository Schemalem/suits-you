class Suit < ApplicationRecord
 belongs_to :user
 has_many :bookings, dependent: :destroy
 has_many_attached :photos

 validates :name, presence: true
 validates :size, presence: true
 validates :colour, presence: true
 validates :style, presence: true
 validates :occasion, presence: true, inclusion: { in: %w(Interview Funeral Wedding Party Date) }
 validates :price, presence: true
 validates :brand, presence: true

 include PgSearch::Model
  pg_search_scope :search_by_name_and_occasion,
    against: [ :name, :occasion],
    using: {
      tsearch: { prefix: true }
    }
end
