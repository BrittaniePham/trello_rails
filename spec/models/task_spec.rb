require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'attributes' do
    it 'has body' do
      body = 'sign up'
      task = Task.create(body: body)
      expect(task.body).to eq(body)
    end

    it 'has priority' do
      priority = 1
      task = Task.create(priority: priority)
      expect(task.priority).to eq(priority)
    end
  end

  describe 'associations' do
    it { should belong_to :list}
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:priority)}
  end
end
