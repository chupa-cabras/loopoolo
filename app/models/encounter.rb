class Encounter < ApplicationRecord
  has_one :user, as: :target_id
  has_one :user, as: :owner_id
end
