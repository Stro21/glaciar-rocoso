class User < ApplicationRecord
  before_create :add_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :maps
  enum role: [:admin, :user]
  def add_role
    if self.role.nil?
      self.role = :user
    end
  end
end
