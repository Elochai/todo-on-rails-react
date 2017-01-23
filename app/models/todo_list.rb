class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :user, :name, presence: true
end
