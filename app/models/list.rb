class List < ApplicationRecord
  validates :title, presence: true
  validates :priority, presence: true
  belongs_to :board
  has_many :tasks, dependent: :destroy

  def self.by_priority
    order(:priority)
  end

  def is_first?
    self.priority === 0
  end

  def is_last?
    
  end

  def self.set_priority_on_creation
    @list = @board.lists.new(list_params)

    max = @board.lists.maximum('priority')
    @list.priority = max + 1
  end

  def self.move_up
    list_to_move_down = @board.lists.find_by(priority: @list.priority - 1)
    @list.update(priority: list_to_move_down.priority) #delete a list, the rest of the numbers do not change
    list_to_move_down.update(priority: list_to_move_down.priority + 1)
  end

  def self.move_down
    list_to_move_up = @board.lists.find_by(priority: @list.priority + 1)
    @list.update(priority: list_to_move_up.priority) #delete a list, the rest of the numbers do not change
    list_to_move_up.update(priority: list_to_move_down.priority - 1)
  end

end
