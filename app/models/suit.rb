class Suit < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

 validates :name, presence: true
 validates :size, presence: true
 validates :colour, presence: true
 validates :style, presence: true
 validates :occasion, presence: true, inclusion: { in: %w(Interview Funeral Wedding Party Date Prom) }
 validates :price, presence: true
 validates :brand, presence: true

 include PgSearch::Model
 pg_search_scope :search_form,
    against: [ :name, :occasion, :size, :colour, :style, :price, :brand],
    using: {
      tsearch: { prefix: true }
    }
end
