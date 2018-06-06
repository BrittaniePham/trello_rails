require 'rails_helper'
require 'pry' 
RSpec.describe ListsController, type: :controller do

  let(:valid_attributes) {
    { title: 'In Progress' }
  }

  let(:invalid_attributes) {
    { title: '' }
  }

  describe "GET #index" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      
      get :index, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :show, params: { board_id: list.board_id, id: list.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :new, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :edit, params: { board_id: list.board_id, id: list.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new list" do
        list = FactoryBot.create(:list)
        expect {
        post :create, params: {board_id: list.board_id, list: valid_attributes}
      }.to change(List, :count).by(1)
      end

      it "redirects to that specific board" do
        list = FactoryBot.create(:list)
        post :create, params: { board_id: list.board_id, list: valid_attributes }
        expect(response).to redirect_to(list.board)
      end
    end

    context "with invalid params" do
      it "does not create list" do
        list = FactoryBot.create(:list)
        post :create, params: { board_id: list.board_id, list: invalid_attributes }
        list.reload
        expect(list.title).to_not eq(invalid_attributes[:title])
      end

      it "returns a success response" do
        list = FactoryBot.create(:list)
        post :create, params: { board_id: list.board_id, list: invalid_attributes }
        expect(response).to be_successful
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
    end

    context "with invalid params" do
    end
  end

  describe "DELETE #destroy" do
  end

  describe "PUT update_list_priority" do

  end

end
