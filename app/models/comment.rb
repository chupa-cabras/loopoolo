class Comment < ApplicationRecord
  belongs_to :encounter
  belongs_to :user
end
