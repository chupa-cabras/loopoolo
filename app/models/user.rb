class User < ApplicationRecord
  enum role: [:hero, :game_master, :admin]
  after_initialize :set_default, :if => :new_record?

  validates :name, presence: true
  validates :email, uniqueness: true, email: true

  def set_default
    self.role ||= :hero
    self.password ||= Rails.application.secrets.default_user_password
    self.password_confirmation ||= Rails.application.secrets.default_user_password
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
