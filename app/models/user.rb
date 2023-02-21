class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups, dependent: :destroy
  has_many :expenses, dependent: :destroy

  validates :name, :email, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true
end
