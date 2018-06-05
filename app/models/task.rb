class Task < ApplicationRecord
  validates :body, presence: true
  validates :priority, presence: true
  belongs_to :list
end

def self.by_priority
  order(:priority)
end