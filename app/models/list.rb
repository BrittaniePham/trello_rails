class List < ApplicationRecord
  validates :title, presence: true
  validates :priority, presence: true
  belongs_to :board
  has_many :tasks, dependent: :destroy

  def self.by_priority
    order(:priority)
  end

end
