require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:valid_attributes) {
    { body: 'wash dishes' }
  }

  let(:invalid_attributes) {
    { body: '' }
  }

  describe "GET #index" do
    it "returns http success" do
      task = FactoryBot.create(:task)

      get :index, params: {list_id: task.list_id}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      task = FactoryBot.create(:task)

      get :show, params: {list_id: task.list_id, id: task.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      task = FactoryBot.create(:task)
      get :new, params: { list_id: task.list_id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      task = FactoryBot.create(:task)
      get :edit, params: {list_id: task.list_id, id: task.id }
      expect(response).to be_successful
    end
  end

end
