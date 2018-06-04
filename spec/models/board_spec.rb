require 'rails_helper'

RSpec.describe Board, type: :model do

  describe 'attributes' do
    it 'has a title' do
      title = 'School'
      board = Board.create(title: title)
      expect(board.title).to eq(title)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

end
