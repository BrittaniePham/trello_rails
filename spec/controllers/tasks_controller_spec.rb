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
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      task = FactoryBot.create(:task)

      get :show, params: {list_id: task.list_id, id: task.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
