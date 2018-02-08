class Encounter < ApplicationRecord
  has_one :user, as: :target_id
  has_one :user, as: :owner_id

  validates :target_id, presence: true
  validates :owner_id, presence: true
  validates :status, presence: true
  validates :date, presence: true

  #TODO: Change to status
  enum statuses: { open:0, complete:1, cancelled:2 }

  def target_name
    get_user(self.target_id).try(:name)
  end

  def get_status
    #TODO:Refactor this !
    self.class.statuses.invert[status]
  end

  def owner_name
    get_user(self.owner_id).try(:name)
  end

  def comments
    Comment.where(encounter: id)
  end 

  def number_of_comments
    comments.size
  end

  private
  def get_user(id)
    User.find(id)
  end

end
