class Task < ApplicationRecord
  validates :body, presence: true
  validates :priority, presence: true
  belongs_to :list
end
