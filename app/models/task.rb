class Task < ActiveRecord::Base
  belongs_to :todo_list

  validates :todo_list, :name, :position, presence: true
end
