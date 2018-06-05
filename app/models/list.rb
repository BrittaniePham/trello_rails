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

end
