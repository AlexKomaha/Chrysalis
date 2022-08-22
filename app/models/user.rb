class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_goals, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :emotions, dependent: :destroy
  has_many :goals, through: :user_goals
  validates :first_name, presence: true
  validates :last_name, presence: true
end
