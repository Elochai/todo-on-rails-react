class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todo_lists, dependent: :destroy

  validates :email, uniqueness: true, email: true
end
