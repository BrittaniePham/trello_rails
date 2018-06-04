require 'rails_helper'

RSpec.describe List, type: :model do
  
  describe 'attributes' do
    it 'has a title' do
      title = 'To Do'
      list = List.create(title: title)
      expect(list.title).to eq(title)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:priority)}
  end
end
