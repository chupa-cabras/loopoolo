class Quest < ApplicationRecord
  #has_one :user, as: :requestor
  #has_one :user, as: :executor

  belongs_to :requestor, :class_name => 'User', :foreign_key => 'requestor_id'
  belongs_to :executor, :class_name => 'User', :foreign_key => 'executor_id'
  validates :status, presence: true

  enum status: { open:0, finished:1, cancelled:2 }
end
