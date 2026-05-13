class Review < ApplicationRecord
  belongs_to :book
  validates :body, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
