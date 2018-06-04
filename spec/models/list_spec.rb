require 'rails_helper'

RSpec.describe List, type: :model do

  describe 'attributes' do
    it 'has a title' do
      title = 'To Do'
      list = List.create(title: title)
      expect(list.title).to eq(title)
    end

    it 'has priority' do
      priority = 1
      list = List.create(priority: priority)
      expect(list.priority).to eq(priority)
    end
  end

  describe 'associations' do
    it { should belong_to :board}
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:priority)}
  end
end
