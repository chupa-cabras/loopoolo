class Quest < ApplicationRecord
  has_one :user, as: :requestor
  has_one :user, as: :executor
  validates :requestor, presence: true
  validates :executor, presence: true
  validates :status, presence: true

  enum status: { open:0, finished:1, cancelled:2 }
end
