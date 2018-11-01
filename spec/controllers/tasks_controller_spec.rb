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

  describe "POST #create" do
    context "with valid params" do
      it "creates a new task" do
        task = FactoryBot.create(:task)
        expect {
          post :create, params: { list_id: task.list_id, task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it "redirects to requested list" do
        task = FactoryBot.create(:task)
        post :create, params: { list_id: task.list_id, task: valid_attributes }
        expect(response).to redirect_to(task.list)
      end
    end

    context "with invalid params" do
      it "does not create task" do
        task = FactoryBot.create(:task)
        expect {
          post :create, params: { list_id: task.list_id, task: invalid_attributes }
        }.to change(Task, :count).by(0)
      end

      it "returns a success response" do
        task = FactoryBot.create(:task)
        post :create, params: { list_id: task.list_id, task: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

end
