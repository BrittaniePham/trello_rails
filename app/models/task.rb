class Task < ApplicationRecord
  validates :body, presence: true
  validates :priority, presence: true
  belongs_to :list

  def self.by_priority
    order(:priority)
  end

  def self.set_priority_on_creation
    @task = @list.tasks.new(task_params)

    max = @list.tasks.maximum('priority')
    @task.priority = max + 1
  end
end