class Board < ApplicationRecord
  validates :title, presence: true
  has_many :lists, dependent: :destroy
end
